//
//  ConnectViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 25/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class ConnectViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var connectTextField: UITextField!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func connectButtonTapped(_ sender: UIButton) {
     
        do {
            try connect()
        } catch {
            UIAlertController.show(from: error as! Error.Name)
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func connect() throws {
    
        guard !connectTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Server Address")
        }
        
        SVProgressHUD.show()
        NetworkAssistant.shared.connect(toAddress: connectTextField.text!) { error in
            
            SVProgressHUD.dismiss()
            error == nil ? AppContainerViewController.setLoginViewController() : UIAlertController.show(from: error)
        }
    }
    
    //MARK: - Overridden
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == connectTextField {
            
            do {
                try connect()
            } catch {
                UIAlertController.show(from: error as! Error.Name)
            }
        }
        
        return true
    }
}
