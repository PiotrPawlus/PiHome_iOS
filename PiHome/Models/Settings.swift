//
//  Settings.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

let CurrentUserIdentifierKey = "CurrentUserIdentifierKey"

class Settings {
    
    static var currentUser: User? {
        
        didSet {
            
            if let user = currentUser {
                
                UserDefaults.standard.set(Int(user.identifier), forKey: CurrentUserIdentifierKey)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    static var isUserLoggedIn: Bool {
        return currentUser != nil
    }
    
    //MARK: - Class Methods
    
    class func logoutUser() {
        currentUser = nil
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
