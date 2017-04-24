//
//  MenuViewModel.swift
//  PiHome
//
//  Created by Piotr Pawluś on 24/04/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

fileprivate enum RestorationIdentifier: String {
    
    case devicesRestorationIdentifier = "DevicesRestorationIdentifier"
    case logoutRestorationIdentifier = "LogoutRestorationIdentifier"
    case usersRestorationIdentifier = "UsersRestorationIdentifier"
}

protocol MenuViewModelOutput: class {
    func update(withUserName userName: String, email: String)
}

class MenuViewModel {

    weak var userInterface: MenuViewModelOutput?
    
    private var appContainer: AppContainerAssistantable
    private var settings: Settingsable
    
    var userName: String?
    var email: String?

    //MARK: - Class Methods

    //MARK: - Initialization

    init(userInterface: MenuViewModelOutput, appContainer: AppContainerAssistantable, settings: Settingsable) {
        
        self.userInterface = userInterface
        self.appContainer = appContainer
        self.settings = settings
    }

    //MARK: - Deinitialization

    //MARK: - Actions

    //MARK: - Open

    //MARK: - Internal
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 && indexPath.row == 0 {
            
            if let user = settings.currentUser {
                return user.administrator ? 50 : 0
            }
        }
        
        return 50
    }
    
    func prepareView() {
        
        guard let user = settings.currentUser else {
            return
        }
        
        userInterface?.update(withUserName: user.fullName, email: user.email)
    }

    func matchController(forRestorationIdentfier identifier: String) {
        
        defer {
            appContainer.dismissMenuViewController()
        }
        
        if case RestorationIdentifier.devicesRestorationIdentifier.rawValue = identifier {
            
            appContainer.setDevicesViewController()
            
        } else if case RestorationIdentifier.usersRestorationIdentifier.rawValue = identifier {
            
            appContainer.setUsersViewController()
            
        } else if case RestorationIdentifier.logoutRestorationIdentifier.rawValue = identifier {
            
            settings.logoutUser()
        }
    }
    
    //MARK: - Private

    //MARK: - Overridden
}
