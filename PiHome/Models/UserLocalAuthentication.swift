//
//  UserLocalAuthentication.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class UserLocalAuthentication: LAContext {
    
    //MARK: - Class Methods
    
    class func authenticate(completion: @escaping () -> ()) {
    
        let context = LAContext()

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "touch_id_permision".localized, reply: { success, error in
                
                DispatchQueue.main.async {
                    
                    if success {
                        completion()
                    }
                }
            })
            
        } else {
            UIAlertController.show(from: Error(error: .touchIdNotAvailable))
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
