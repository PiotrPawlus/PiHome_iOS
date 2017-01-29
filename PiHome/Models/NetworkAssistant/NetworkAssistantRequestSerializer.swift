//
//  NetworkAssistantRequestSerializer.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class NetworkAssistantRequestSerializer: AFJSONRequestSerializer {
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    override func request(bySerializingRequest request: URLRequest, withParameters parameters: Any?, error: NSErrorPointer) -> URLRequest? {
        
        var params = parameters as? [AnyHashable: Any] ?? [AnyHashable: Any]()
        params["timestamp"] = Date().timeIntervalSince1970
        
        if let user = Settings.currentUser {
            setValue("Basic " + user.authenticationToken, forHTTPHeaderField: "Authorization")
        }
        
        return super.request(bySerializingRequest: request, withParameters: params, error: error)
    }
}

