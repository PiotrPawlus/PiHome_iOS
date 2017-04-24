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

protocol Settingsable {
    
    var isUserLoggedIn: Bool { get }
    var currentUser: User? { get set }
    
    func logoutUser()
}

class Settings: Settingsable {
    
    static var shared = Settings()
    
    var currentUser: User?
    
    var isUserLoggedIn: Bool {
        return currentUser != nil
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func logoutUser() {
        
        CoreDataAssistant.logOut(currentUser) { error in
            
            UIAlertController.show(from: error)
            
            if error == nil {
                
                self.currentUser = nil
                AppContainerViewController.shared.setLoginViewController()
            }
        }
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
