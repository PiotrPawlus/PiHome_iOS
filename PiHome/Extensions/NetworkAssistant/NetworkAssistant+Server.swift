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
    
        let networkAssistantBaseUrl = address + NetworkAssistantSufixUrl
        
        _ = get(networkAssistantBaseUrl, parameters: nil, progress: nil, success: { _, response in
            
            UserDefaults.parseAndSaveServerAddress(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(Error(error: error))
            
        })
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
