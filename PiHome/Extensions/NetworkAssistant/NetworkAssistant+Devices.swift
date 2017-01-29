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
    
    func devices(completion: @escaping ErrorHandler) {
     
        requestType = .devices
        
        _ = get("devices", parameters: nil, progress: nil, success: { _, response in

            if let user = Settings.currentUser {
                CoreDataAssistant.parseAndSaveDevices(with: response, user: user, completion: completion)
            }
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
