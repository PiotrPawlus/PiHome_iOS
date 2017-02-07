//
//  DeviceStateButton.swift
//  PiHome
//
//  Created by Piotr Pawluś on 29/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class DeviceStateButton: AttributedButton {
    
    @IBInspectable var deviceState: Bool = false {
        
        didSet {
            
            setTitle(deviceState ? "OFF" : "ON", for: .normal)
            backgroundColor = deviceState ? UIColor.red : UIColor.mantis
        }
    }
}
