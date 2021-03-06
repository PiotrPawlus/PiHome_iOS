//
//  NetworkAssistant+Devices.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

extension NetworkAssistant {
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func changeState(of device: Device, completion: @escaping ErrorHandler) {
        
        requestType = .device
        
        let query = "device/\(device.identifier)/state"
        
        _ = post(query, parameters: nil, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveDevice(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    func createDevice(with parameters: [AnyHashable: Any], completion: @escaping ErrorHandler) {
        
        requestType = .newDevice
        
        _ = post("device", parameters: parameters, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveDevice(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    func devices(completion: @escaping ErrorHandler) {
     
        requestType = .devices
        
        _ = get("devices", parameters: nil, progress: nil, success: { _, response in

            if let user = Settings.shared.currentUser {
                CoreDataAssistant.parseAndSaveDevices(with: response, user: user, completion: completion)
            }
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    func remove(device: Device, completion: @escaping ErrorHandler) {
        
        requestType = .removeDevice
        
        let query = "device/\(device.identifier)"
        
        _ = delete(query, parameters: nil, success: { _, response in
            
            MagicalRecord.save({ context in
                
                Device.remove(device: device, in: context)
                
            }, completion: { _, error in
                
                completion(Error(error: error))
            })
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
