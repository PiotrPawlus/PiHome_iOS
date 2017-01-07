//
//  NetworkAssistant+Server.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

extension NetworkAssistant {
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func connect(toAddress address: String, completion: @escaping ErrorHandler) {
        
        requestType = .server(address)
        
        _ = get("", parameters: nil, progress: nil, success: { _, response in
            
            if let dictionary = response as? [AnyHashable: Any], let address = dictionary["url"] as? String {
                
                UserDefaults.standard.set(address, forKey: NetworkAssistantUrl)
                UserDefaults.standard.synchronize()
                
                completion(nil)
            }
            
        }, failure: { _, error in
            
            UserDefaults.standard.removeObject(forKey: NetworkAssistantUrl)
            
            completion(Error(error: error))
        })
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
