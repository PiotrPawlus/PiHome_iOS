//
//  AppContainerViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let SideMenuNavigationControllerIdentifier = "SideMenuNavigationControllerIdentifier"

protocol AppContainerAssistantable {
    
    func dismissMenuViewController()
    func dismissMenuViewController(withCompletion completion: (() -> ())?)
    func presentMenuViewController()
    func setConnectViewController()
    func setDevicesViewController()
    func setLoginViewController()
    func setRegisterViewController()
    func setUsersViewController()
}

class AppContainerViewController: ContainerViewController, AppContainerAssistantable {
    
    private var appContainer: AppContainerViewController?
    
    static var shared = AppContainerViewController()
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let piHomeNavigationController =  UIStoryboard(name: "PiHome", bundle: nil).instantiateViewController(withIdentifier: SideMenuNavigationControllerIdentifier) as? UISideMenuNavigationController
        piHomeNavigationController?.leftSide = true
        
        SideMenuManager.menuAnimationBackgroundColor = UIColor.frenchGray
        SideMenuManager.menuLeftNavigationController = piHomeNavigationController
        SideMenuManager.menuWidth = 260
        
        appContainer = self
        
        UserDefaults.standard.string(forKey: NetworkAssistantUrl) != nil ? setLoginViewController() : setConnectViewController()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    func dismissMenuViewController() {
        SideMenuManager.menuLeftNavigationController?.dismiss(animated: true, completion: nil)
    }
    
    func dismissMenuViewController(withCompletion completion: (() -> ())?) {
        SideMenuManager.menuLeftNavigationController?.dismiss(animated: true, completion: completion)
    }
    
    func presentMenuViewController() {
        appContainer?.present(SideMenuManager.menuLeftNavigationController!, animated: true)
    }
    
    func setConnectViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Connect", bundle: nil).instantiateInitialViewController())
    }
    
    func setDevicesViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Device", bundle: nil).instantiateInitialViewController())
    }
    
    func setLoginViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController())
    }
    
    func setRegisterViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController())
    }
    
    func setUsersViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Users", bundle: nil).instantiateInitialViewController())
    }
    
    //MARK: - Private
    
    private func loadControllerIntoContainer(controller: UIViewController?) {
        
        if let controller = controller, let appContainer = appContainer {
            
            appContainer.oldViewController?.willMove(toParentViewController: nil)
            appContainer.oldViewController?.view.removeFromSuperview()
            appContainer.oldViewController?.removeFromParentViewController()
            
            appContainer.addChildViewController(controller)
            appContainer.container.addSubview(controller.view)
            
            appContainer.oldViewController = controller
            
            controller.view.frame = appContainer.container.bounds
            controller.didMove(toParentViewController: appContainer)
            
            (controller as? Container)?.containerViewController = appContainer
        }
    }
    
    //MARK: - Overridden
}
