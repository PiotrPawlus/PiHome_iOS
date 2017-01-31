//
//  NetworkAssistant+User.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension NetworkAssistant {
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func administration(for user: User, completion: @escaping ErrorHandler) {
        
        requestType = .administration
        
        let query = "users/\(user.identifier)/administration"
        
        _ = post(query, parameters: nil, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveUser(with: response, completion: { _, error in
                completion(error)
            })
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    func authorization(for user: User, completion: @escaping ErrorHandler) {
        
        requestType = .authorization
        
        let query = "users/\(user.identifier)/authorization"
        
        _ = post(query, parameters: nil, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveUser(with: response, completion: { _, error in
                completion(error)
            })
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    func login(withEmail email: String, password: String, completion: @escaping UserHandler) {
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        requestType = .login("j.l@example.com")

        _ = post("authentication", parameters: parameters, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveUser(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(nil, Error(error: error))
        })
    }
    
    func register(with parameters: [AnyHashable: Any], completion: @escaping UserHandler) {
        
        requestType = .register
        
        _ = post("registration", parameters: parameters, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveUser(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(nil, Error(error: error))
        })
    }
    
    func users(completion: @escaping ErrorHandler) {
        
        requestType = .users
        
        _ = get("users", parameters: nil, progress: nil, success: { _, response in
            
            CoreDataAssistant.parseAndSaveUsers(with: response, completion: completion)
            
        }, failure: { _, error in
            
            completion(Error(error: error))
        })
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
