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
            layer.borderWidth = 3
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var imageScale: CGFloat = 1 {
        
        didSet {
            
            if let imageView = imageView {
                
                let size = CGSize(width: imageView.frame.size.width * imageScale, height: imageView.frame.size.height * imageScale)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                
                imageView.image?.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                setImage(UIGraphicsGetImageFromCurrentImageContext(), for: .normal)
                
                UIGraphicsEndImageContext()
            }
        }
    }
}
