//
//  XCUIElement+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    func cancel() {
        buttons["Cancel"].tap()
    }
    
    func confirm() {
        buttons["OK"].tap()
    }
    
    func clear() {
        
        coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9)).tap()
        
        let deleteString = [String](repeating: XCUIKeyboardKeyDelete, count: (value as! String).characters.count + 1)
        typeText(deleteString.joined(separator: ""))
    }
    
    func pressReturn() {
        
        tap()
        typeText("\n")
    }
    
    func tapCell(atIndex index: UInt) {
        cells.element(boundBy: index).tap()
    }
    
    func type(text: String) {
        
        tap()
        typeText(text)
    }
    
    func tapIfExists() {
        
        if exists {
            tap()
        }
    }
    
    //MARK: - Private
    
    //MARK: - Overridde
}
