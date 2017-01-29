//
//  TableViewCell.swift
//  PiHome
//
//  Created by Piotr Pawluś on 29/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class TableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var stateButton: DeviceStateButton!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func changeDeviceState(_ sender: AttributedButton) {
        
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func configure(with device: Device) {
        
        titleLabel.text = device.name
        stateButton.deviceState = device.state
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
