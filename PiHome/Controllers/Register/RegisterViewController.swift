//
//  RegisterViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var bottomLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var firstNameTextField: UITextField!
    @IBOutlet private var lastNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var confirmPasswordTextField: UITextField!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        firstNameTextField.becomeFirstResponder()
    }
    
    //MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions
    
    @IBAction func backBarButtonTapped(_ sender: UIBarButtonItem) {
        AppContainerViewController.shared.setLoginViewController()
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
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
            updateConstraints(with: keyboardHeight)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        updateConstraints()
    }
    
    //MARK: - Private
    
    private func register() throws {
        
        guard !firstNameTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("first_name")
        }
        
        guard !lastNameTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("last_name")
        }
        
        guard emailTextField.text!.isValidEmail else {
            throw Error.Name.email
        }
        
        guard !passwordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("password")
        }
        
        guard !confirmPasswordTextField.text!.isEmpty else {
            throw Error.Name.cannotBeEmpty("confirm_password")
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
                
                Settings.shared.currentUser = user
                
                UIAlertController.show(from: Error(error: Error.Name.unauthorized))
                AppContainerViewController.shared.setLoginViewController()
            }
        }
    }
    
    private func updateConstraints(with height: CGFloat = 0) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            
            self.bottomLayoutConstraint.constant = max(height, 0)
            self.view.layoutIfNeeded()
        })
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
