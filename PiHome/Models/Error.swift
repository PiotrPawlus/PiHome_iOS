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
                title = errorTitle.localized
            case .email:
                title = "email".localized
            case .noDataFound:
                title = "no_data_found".localized
            case .passwords:
                title = "passwords".localized
            case .touchIdNotAvailable:
                title = "touch_id.title".localized
            case .unauthorized:
                title = "please_wait.title".localized
            }
            
            return title
        }
        
        var description: String {
            
            var description: String
            
            switch self {
            case .cannotBeEmpty(_):
                description = "cannot_be_empty".localized
            case .email:
                description = "valid_email".localized
            case .noDataFound:
                description = "try_again".localized
            case .passwords:
                description = "passwords_must_match".localized
            case .touchIdNotAvailable:
                description = "touch_id.description".localized
            case .unauthorized:
                description = "please_wait.description".localized
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
                        
                        userInfo[NSLocalizedDescriptionKey] = description.localized
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
