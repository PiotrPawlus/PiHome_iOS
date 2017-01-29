//
//  DetialDeviceViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class DetailDeviceViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var deviceStateButton: DeviceStateButton!
    @IBOutlet var wraperView: UIView!
    
    var device: Device?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let device = device {
            
            nameLabel.text = device.name
            descriptionTextView.text = device.information
            deviceStateButton.deviceState = device.state
            
        } else {
            wraperView.isHidden = true
        }
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func changeDeviceStateButtonTapped(_ sender: DeviceStateButton) {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.changeState(of: device!) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                sender.deviceState = !sender.deviceState
            }
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
