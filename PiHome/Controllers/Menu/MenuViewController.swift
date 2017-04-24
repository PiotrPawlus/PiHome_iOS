//
//  MenuViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let DevicesRestorationIdentifier = "DevicesRestorationIdentifier"
private let LogoutRestorationIdentifier = "LogoutRestorationIdentifier"
private let UsersRestorationIdentifier = "UsersRestorationIdentifier"

class MenuViewController: UITableViewController, MenuViewModelOutput {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    private var eventHandler: MenuViewModel!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler = MenuViewModel(userInterface: self, appContainer: AppContainerViewController.shared, settings: Settings.shared)
        eventHandler.prepareView()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let restorationIdentifier = tableView.cellForRow(at: indexPath)?.restorationIdentifier {
            eventHandler.matchController(forRestorationIdentfier: restorationIdentifier)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return eventHandler.heightForRow(at: indexPath)
    }
    
    //MARK: - MenuViewModelOutput
    
    func update(withUserName userName: String, email: String) {
        
        userNameLabel.text = userName
        userEmailLabel.text = email
    }
}
