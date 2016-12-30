//
//  UIAlertController+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension UIAlertController {
    
    class func show(from error: Error.Name) {
        show(withMessage: error.description)
    }
    
    class func show(from error: Error?, dismiss: Bool = true) {
        
        if let error = error, AFNetworkReachabilityManager.shared().isReachable {
            
            let message = error.userInfo[NSLocalizedDescriptionKey] as? String ?? error.localizedDescription
            
            if error.code == 401 {
                
                Settings.logoutUser()
                
                if dismiss {
                    AppContainerViewController.setLoginViewController()
                }
            }
            
            show(withMessage: message)
        }
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    class func show(withMessage message: String) {
        
        let alert = UIAlertController(title: NSLocalizedString("error", comment: ""), message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        }
        
        alert.addAction(action)
        
        UIViewController.top()?.present(alert, animated: true)
    }
    
    //MARK: - Overridden
}

