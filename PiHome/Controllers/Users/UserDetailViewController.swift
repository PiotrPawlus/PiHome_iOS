//
//  UserDetailViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class UserDetailViewController: UIViewController {
    
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var isAuthorizedUserStateView: UserStateView!
    @IBOutlet private var administratorUserStateView: UserStateView!
    @IBOutlet private var isAuthorizedUserStateButton: UserStateButton!
    @IBOutlet private var administratorUserStateButton: UserStateButton!
    @IBOutlet private var wraperView: UIView!
    
    var user: User?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user == nil ? wraperView.isHidden = true : updateView()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func authorizedButtonTapped(_ sender: UserStateButton) {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.authorization(for: user!) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                self.updateView()
            }
        }
    }
    
    @IBAction func administrateButtonTapped(_ sender: UserStateButton) {
    
        SVProgressHUD.show()
        
        NetworkAssistant.shared.administration(for: user!) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                self.updateView()
            }
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func updateView() {
        
        fullNameLabel.text = user!.fullName
        emailLabel.text = user!.email
        isAuthorizedUserStateView.isActive = user!.isAuthorized
        administratorUserStateView.isActive = user!.administrator
        isAuthorizedUserStateButton.isActive = user!.isAuthorized
        administratorUserStateButton.isActive = user!.administrator
    }
    
    //MARK: - Overridden
}
