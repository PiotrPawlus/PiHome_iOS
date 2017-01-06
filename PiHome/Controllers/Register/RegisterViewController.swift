//
//  RegisterViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var firstNameTextField: UITextField!
    @IBOutlet private var lastNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var confirmPasswordTextField: UITextField!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.becomeFirstResponder()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func backBarButtonTapped(_ sender: UIBarButtonItem) {
        AppContainerViewController.setLoginViewController()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
        do {
            try register()
        } catch {
            UIAlertController.show(from: error as! Error.Name)
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func register() throws {
        
        guard !firstNameTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("First Name")
        }
        
        guard !lastNameTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Last Name")
        }
        
        guard emailTextField.text!.isValidEmail else {
            throw Error.Name.email
        }
        
        guard !passwordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Password")
        }
        
        guard !confirmPasswordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Confirm password")
        }
        
        guard passwordTextField.text == confirmPasswordTextField.text else {
            throw Error.Name.passwords
        }
        
        let dictionary = [
        
            "first_name": firstNameTextField.text!,
            "last_name": lastNameTextField.text!,
            "email": emailTextField.text!,
            "password": passwordTextField.text!
        ]
        
        SVProgressHUD.show()
        NetworkAssistant.shared.register(with: dictionary) { user, error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                
                _ = Keychain.save(self.emailTextField.text!, forKey: EmailPiHomeKeychain)
                _ = Keychain.save(self.passwordTextField.text!, forKey: PasswordPiHomeKeychain)
                
                Settings.currentUser = user
                
                if let user = user, user.isAuthorized {
                    AppContainerViewController.setDevicesViewController()
                } else {
                 
                    UIAlertController.show(from: Error(error: Error.Name.unauthorized))
                    AppContainerViewController.setLoginViewController()
                }
            }
        }
    }
    
    //MARK: - Overridden
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNameTextField {
          
            lastNameTextField.becomeFirstResponder()
        
        } else if textField == lastNameTextField {
        
            emailTextField.becomeFirstResponder()
        
        } else if textField == emailTextField {
            
            passwordTextField.becomeFirstResponder()
        
        } else if textField == passwordTextField {
            
            confirmPasswordTextField.becomeFirstResponder()
            
        } else {
        
            do {
                try register()
            } catch {
                UIAlertController.show(from: error as! Error.Name)
            }
        }
        
        return true
    }
}
