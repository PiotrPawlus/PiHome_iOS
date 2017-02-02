//
//  UserTableViewCell.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class UserTableViewCell: TableViewCell {

    @IBOutlet private var administratorView: UserStateView!
    @IBOutlet private var authorizedView: UserStateView!
    
    private var device: Device?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions}
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func configure(with user: User) {
        
        super.configure(withTitle: user.fullName)
        
        administratorView.isActive = user.administrator
        authorizedView.isActive = user.isAuthorized
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}

