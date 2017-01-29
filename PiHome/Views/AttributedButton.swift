//
//  AttributedButton.swift
//  PiHome
//
//  Created by Piotr Pawluś on 29/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class AttributedButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = 1
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}
