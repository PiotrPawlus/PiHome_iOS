//
//  DevicesViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class DevicesViewController: UITableViewController {
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuGestureRecognizer()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func menuBarButtonItemTapped(_ sender: UIBarButtonItem ) {
        AppContainerViewController.presentMenuViewController()
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
