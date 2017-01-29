//
//  Error.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

let LocalizedTitleKey = "LocalizedTitleKey"

open class Error: Swift.Error {
    
    var userInfo = [AnyHashable: Any]()
    var code = 0
    
    var localizedDescription: String {
        return userInfo[NSLocalizedDescriptionKey] as? String ?? ""
    }
    
    enum Name: Swift.Error {
        
        case cannotBeEmpty(String)
        case email
        case noDataFound
        case passwords
        case touchIdNotAvailable
        case unauthorized
        
        var title: String {
            
            let title: String
            
            switch self {
            case .cannotBeEmpty(let errorTitle):
                title = errorTitle
            case .email:
                title = "Email"
            case .noDataFound:
                title = "No data found"
            case .passwords:
                title = "Passwords"
            case .touchIdNotAvailable:
                title = "Touch ID not available"
            case .unauthorized:
                title = "Please wait..."
            }
            
            return title
        }
        
        var description: String {
            
            var description: String
            
            switch self {
            case .cannotBeEmpty(_):
                description = "Cannot be empty."
            case .email:
                description = "Email must be valid."
            case .noDataFound:
                description = "Try again."
            case .passwords:
                description = "Password confirmation and Password must match."
            case .touchIdNotAvailable:
                description = "Your device is not configured for Touch ID."
            case .unauthorized:
                description = "Please wait for permission from system administrator."
            }
            
            return description
        }
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    init?(error: Swift.Error?) {
        
        guard let error = error as? NSError else {
            return nil
        }
        
        code = (error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] as? HTTPURLResponse)?.statusCode ?? 0
        
        if let responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as? Data {
            
            do {
                
                if let response = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [AnyHashable: Any] {
                
                    if let description = response["description"] as? String {
                        
                        userInfo[NSLocalizedDescriptionKey] = description
                    }
                    
                } else {
                    userInfo[NSLocalizedDescriptionKey] = error.localizedDescription
                }
            } catch _ {
                userInfo[NSLocalizedDescriptionKey] = error.localizedDescription
            }
            
        } else {
            userInfo[NSLocalizedDescriptionKey] = error.localizedDescription
        }
    }
    
    init(error: Error.Name) {
        
        userInfo = [
            
            LocalizedTitleKey: error.title,
            NSLocalizedDescriptionKey: error.description
        ]
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
