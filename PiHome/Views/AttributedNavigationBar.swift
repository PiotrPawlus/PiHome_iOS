//
//  AttributedNavigationBar.swift
//  PiHome
//
//  Created by Piotr Pawluś on 01/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@IBDesignable class AttributedNavigationBar: UINavigationBar {

    var title: String? = "" {
        
        didSet {
            topItem?.title = title
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 18 {
        
        didSet {
            
            self.icomoonLeftBarButtonItems = (icomoonLeftBarButtonItems)
            self.icomoonRightBarButtonItems = (icomoonRightBarButtonItems)
        }
    }
    
    @IBInspectable var icomoonLeftBarButtonItems: Bool = false {
        
        didSet {
            
            let attributes = [NSFontAttributeName: UIFont(name: "Icomoon", size: fontSize)!]
            
            if let leftBarButtonItems = topItem?.leftBarButtonItems {
                
                for leftBarButtonItem in leftBarButtonItems {
                    leftBarButtonItem.setTitleTextAttributes(icomoonLeftBarButtonItems ? attributes : nil, for: .normal)
                }
            }
        }
    }
    
    @IBInspectable var icomoonRightBarButtonItems: Bool = false {
        
        didSet {
            
            let attributes = [NSFontAttributeName: UIFont(name: "Icomoon", size: fontSize)!]
            
            if let rightBarButtonItems = topItem?.rightBarButtonItems {
                
                for rightBarButtonItem in rightBarButtonItems {
                    rightBarButtonItem.setTitleTextAttributes(icomoonRightBarButtonItems ? attributes : nil, for: .normal)
                }
            }
        }
    }
    
    @IBInspectable var transparentBackground: Bool = false {
        
        didSet {
            
            setBackgroundImage(transparentBackground ? UIImage() : nil, for: .default)
            shadowImage = transparentBackground ? UIImage() : nil
        }
    }
}
