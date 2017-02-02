//
//  DeviceTableViewCell.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class DeviceTableViewCell: TableViewCell {
    
    @IBOutlet private var detailLabel: UILabel!
    
    private var device: Device?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func changeDeviceState(_ sender: AttributedButton) {
        
        SVProgressHUD.show()
        sender.borderColor = UIColor.red
        
        NetworkAssistant.shared.changeState(of: device!) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                sender.borderColor = UIColor.mantis
            }
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func configure(with device: Device) {
        
        super.configure(withTitle: device.name)
        detailLabel.text = device.information
        
        self.device = device
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
