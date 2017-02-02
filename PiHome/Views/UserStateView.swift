//
//  UserStateView.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class UserStateView: AttributedView {
    
    @IBInspectable var isActive: Bool = false {
        
        didSet {
            
            backgroundColor = isActive ? UIColor.lynch : UIColor.white
        }
    }
}
