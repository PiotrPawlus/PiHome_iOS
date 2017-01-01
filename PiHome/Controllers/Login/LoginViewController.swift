//
//  LoginViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        do {
            try login()
        } catch {
            UIAlertController.show(from: error as! Error.Name)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        AppContainerViewController.setRegisterViewController()
    }
    
    @IBAction func viewTapped(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func login() throws {
        
        guard emailTextField.text!.isValidEmail else {
            throw Error.Name.email
        }
        
        guard !passwordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Password")
        }
        
        SVProgressHUD.show()
        NetworkAssistant.shared.login(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if let user = user, error == nil {
                
                Settings.currentUser = user
                AppContainerViewController.setHomeViewController()
            }
        }
    }
    
    //MARK: - Overridden
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            
            do {
                try login()
            } catch {
                UIAlertController.show(from: error as! Error.Name)
            }
        }
        
        return true
    }
}
