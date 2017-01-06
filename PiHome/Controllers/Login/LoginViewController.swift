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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quickLogin()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func backBarButtonTapped(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.removeObject(forKey: NetworkAssistantUrl)
        
        _ = Keychain.delete(EmailPiHomeKeychain)
        _ = Keychain.delete(PasswordPiHomeKeychain)
        
        AppContainerViewController.setConnectViewController()
    }
    
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
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func login(withEmail email: String, password: String) {
        
        SVProgressHUD.show()
        NetworkAssistant.shared.login(withEmail: email, password: password) { user, error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if let user = user, error == nil {
                
                _ = Keychain.save(self.emailTextField.text!, forKey: EmailPiHomeKeychain)
                _ = Keychain.save(self.passwordTextField.text!, forKey: PasswordPiHomeKeychain)
                
                Settings.currentUser = user
                
                AppContainerViewController.setDevicesViewController()
            }
        }
    }
    
    private func login() throws {
        
        guard emailTextField.text!.isValidEmail else {
            throw Error.Name.email
        }
        
        guard !passwordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("Password")
        }
        
        login(withEmail: emailTextField.text!, password: passwordTextField.text!)
    }
    
    private func quickLogin() {
        
        guard let email = Keychain.load(EmailPiHomeKeychain) else {
            return
        }
        
        guard let password = Keychain.load(PasswordPiHomeKeychain) else {
            return
        }
        
        if let user = Settings.currentUser, user.isAuthorized {
            UserLocalAuthentication.authenticate {
                self.login(withEmail: email, password: password)
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
