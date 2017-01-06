//
//  Settings.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

let CurrentUserIdentifierKey = "CurrentUserIdentifierKey"
let EmailPiHomeKeychain = "EmailPiHomeKeychain"
let PasswordPiHomeKeychain = "PasswordPiHomeKeychain"

class Settings {
    
    static var currentUser: User?
    
    static var isUserLoggedIn: Bool {
        return currentUser != nil
    }
    
    //MARK: - Class Methods
    
    class func logoutUser() {
        
        CoreDataAssistant.logOut(currentUser) { error in
            
            UIAlertController.show(from: error)
            
            if error == nil {
                
                currentUser = nil
                AppContainerViewController.setLoginViewController()
            }
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
