//
//  UserStateButton.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class UserStateButton: AttributedButton {
    
    @IBInspectable var isActive: Bool = false {
        
        didSet {
            
            backgroundColor = isActive ? UIColor.mantis : UIColor.red
        }
    }
}
