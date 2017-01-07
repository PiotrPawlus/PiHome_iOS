//
//  CoreDataAssistant+Device.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

extension CoreDataAssistant {
    
    //MARK: - Class Methods
    
    class func parseAndSaveDevices(with response: Any?, user: User?, completion: @escaping ErrorHandler) {
        
        if let dictionaries = (response as? [AnyHashable: Any])?["devices"] as? [[AnyHashable: Any]] {
            
            MagicalRecord.save({ context in
                
                if let user = user?.mr_(in: context) {
                 
                    for dictionary in dictionaries {
                        
                        let device = Device.createOrUpdate(with: dictionary, in: context)
                        device.user = user
                    }
                }
                
            }, completion: { _, error in
                
                completion(Error(error: error))
            })
            
        } else {
            completion(Error(error: .noDataFound))
        }
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
