//
//  DeviceSwitchTableViewCell.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class DeviceSwitchTableViewCell: TableViewCell {
    
    @IBOutlet private var detailLabel: UILabel!
    @IBOutlet private var switchDeviceStateButton: DeviceStateButton!
    
    private var device: Device?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func changeDeviceState(_ sender: DeviceStateButton) {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.changeState(of: device!) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func configure(with device: Device) {
        
        super.configure(withTitle: device.name)
        detailLabel.text = device.information
        switchDeviceStateButton.deviceState = device.state
        
        self.device = device
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}

