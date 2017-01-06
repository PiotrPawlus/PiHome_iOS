//
//  AppContainerViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let SideMenuNavigationControllerIdentifier = "SideMenuNavigationControllerIdentifier"

class AppContainerViewController: ContainerViewController {
    
    static var appContainer: AppContainerViewController?
    
    //MARK: - Class Methods
    
    class func dismissMenuViewController(withCompletion completion: (() -> ())? = nil) {
        SideMenuManager.menuLeftNavigationController?.dismiss(animated: true, completion: completion)
    }
    
    class func presentMenuViewController() {
        appContainer?.present(SideMenuManager.menuLeftNavigationController!, animated: true)
    }
    
    class func setConnectViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Connect", bundle: nil).instantiateInitialViewController())
    }
    
    class func setLoginViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController())
    }
    
    class func setDevicesViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Device", bundle: nil).instantiateInitialViewController())
    }
    
    class func setRegisterViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController())
    }
    
    class func setSettingsViewController() {
        loadControllerIntoContainer(controller: UIStoryboard(name: "Settings", bundle: nil).instantiateInitialViewController())
    }
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let piHomeNavigationController =  UIStoryboard(name: "PiHome", bundle: nil).instantiateViewController(withIdentifier: SideMenuNavigationControllerIdentifier) as? UISideMenuNavigationController
        piHomeNavigationController?.leftSide = true
        
        SideMenuManager.menuAnimationBackgroundColor = UIColor.red
        SideMenuManager.menuLeftNavigationController = piHomeNavigationController
        SideMenuManager.menuWidth = 260
        
        AppContainerViewController.appContainer = self
        
        UserDefaults.isServerAddres ? AppContainerViewController.setLoginViewController() : AppContainerViewController.setConnectViewController()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    class private func loadControllerIntoContainer(controller: UIViewController?) {
        
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
