//
//  LoginViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private var bottomLayoutConstraint: NSLayoutConstraint!

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        quickLogin()
    }
    
    //MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
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
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
            updateConstraints(with: keyboardHeight)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        updateConstraints()
    }
    
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
    
    private func updateConstraints(with height: CGFloat = 0) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            
            self.bottomLayoutConstraint.constant = max(height, 0)
            self.view.layoutIfNeeded()
        })
    }
    
    private func quickLogin() {
        
        guard let email = Keychain.load(EmailPiHomeKeychain) else {
            return
        }
        
        guard let password = Keychain.load(PasswordPiHomeKeychain) else {
            return
        }
        
        if !Settings.isUserLoggedIn {
         
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
