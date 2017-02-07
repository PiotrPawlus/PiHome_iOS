//
//  DeviceTypeButton.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class DeviceTypeButton: AttributedButton {
    
    @IBInspectable var isActive: Bool = false {
        
        didSet {
            
            backgroundColor = isActive ? UIColor.lynch : UIColor.white
        }
    }
}
