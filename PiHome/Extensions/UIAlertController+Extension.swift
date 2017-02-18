//
//  UIAlertController+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension UIAlertController {
    
    //MARK: - Class Methods
    
    class func show(from error: Error.Name) {
        
        show(with: error.title, message: error.description)
    }
    
    class func show(from error: Error?, dismiss: Bool = true) {
        
        if let error = error, AFNetworkReachabilityManager.shared().isReachable {
            
            let errorTitle = (error.userInfo[LocalizedTitleKey] as? String)?.localized ?? "error".localized
            let errorMessage = error.userInfo[NSLocalizedDescriptionKey] as? String ?? error.localizedDescription
            
            if error.code == 401 {
                
                Settings.logoutUser()
                AppContainerViewController.dismissModalControllers()
                
                if dismiss {
                    AppContainerViewController.setLoginViewController()
                }
            }
            
            show(with: errorTitle, message: errorMessage)
        }
    }

    //MARK: - Initialization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private class func show(with title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        }
        
        alert.addAction(action)
        UIViewController.top()?.present(alert, animated: true)
    }
    
    //MARK: - Overridden
}

