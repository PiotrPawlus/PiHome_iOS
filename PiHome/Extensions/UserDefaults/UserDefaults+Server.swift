//
//  UserDefaults+Server.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

extension UserDefaults {
    
    static var isServerAddres: Bool {
        return standard.string(forKey: NetworkAssistantUrl) != nil
    }
    
    //MARK: - Class Methods
    
    class func parseAndSaveServerAddress(with response: Any?, completion: @escaping ErrorHandler) {
        
        if let dictionary = response as? [AnyHashable: Any], let address = dictionary["url"] {
        
            standard.set(address, forKey: NetworkAssistantUrl)
            standard.synchronize()
            
            completion(nil)
        
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
