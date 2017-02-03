//
//  AttributedBarButtonItem.swift
//  PiHome
//
//  Created by Piotr Pawluś on 03/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

class AttributedBarButtonItem: UIBarButtonItem {
    
    var isHidden: Bool = false {
        
        didSet {
            
            isEnabled = !isHidden
            tintColor = isHidden ? UIColor.clear : nil
        }
    }
}

