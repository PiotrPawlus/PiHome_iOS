//
//  SplitViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        minimumPrimaryColumnWidth = 250
        preferredDisplayMode = .allVisible
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    //MARK: - UISplitViewControllerDelegate
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
