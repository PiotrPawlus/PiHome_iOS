//
//  UIViewController+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension UIViewController {
    
    //MARK: - Class Methods
    
    class func top(from base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let controller = base as? AppContainerViewController {
            return top(from: controller.childViewControllers.first)
        }
        
        if let controller = base as? UISplitViewController {
            return top(from: controller.viewControllers.last)
        }
        
        if let controller = base as? UINavigationController {
            return top(from: controller.visibleViewController)
        }
        
        if let controller = base?.presentedViewController {
            return top(from: controller)
        }
        
        return base
    }
    
    class func dismissModalControllers(completion: (() -> ())? = nil) {
        
        if top()?.presentingViewController != nil {
            
            top()?.dismiss(animated: true) {
                dismissModalControllers(completion: completion)
            }
            
        } else {
            completion?()
        }
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func setupMenuGestureRecognizer() -> UIPanGestureRecognizer {
        return SideMenuManager.menuAddPanGestureToPresent(toView: view)
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
