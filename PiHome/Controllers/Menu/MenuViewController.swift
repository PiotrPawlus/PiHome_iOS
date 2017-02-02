//
//  MenuViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let DevicesRestorationIdentifier = "DevicesRestorationIdentifier"
private let LogoutRestorationIdentifier = "LogoutRestorationIdentifier"
private let SettingsRestorationIdentifier = "SettingsRestorationIdentifier"

class MenuViewController: UITableViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userNameLabel.text = Settings.currentUser?.fullName
        userEmailLabel.text = Settings.currentUser?.email
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let restorationIdentifier = tableView.cellForRow(at: indexPath)?.restorationIdentifier {

            if case DevicesRestorationIdentifier = restorationIdentifier {
                
                AppContainerViewController.setDevicesViewController()
                
            } else if case SettingsRestorationIdentifier = restorationIdentifier {
                
                AppContainerViewController.setSettingsViewController()
                
            } else if case LogoutRestorationIdentifier = restorationIdentifier {
                
                Settings.logoutUser()
            }
            
            AppContainerViewController.dismissMenuViewController()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        print("section \(indexPath.section) index \(indexPath.row)")
    
        if indexPath.section == 1 && indexPath.row == 0 {
            
            if let user = Settings.currentUser {
                return user.administrator ? 50 : 0
            }
        }
        
        return 50
    }
}
