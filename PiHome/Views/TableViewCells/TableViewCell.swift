//
//  TableViewCell.swift
//  PiHome
//
//  Created by Piotr Pawluś on 29/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class TableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
