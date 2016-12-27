//
//  AttributedView.swift
//  PiHome
//
//  Created by Piotr Pawluś on 24/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

@IBDesignable class AttributedView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}
