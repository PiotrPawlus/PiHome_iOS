//
//  AttributedButtonTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 29/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class AttributedButtonTests: XCTestCase {
    
    func testBorderColor() {
        
        let button = AttributedButton()
        button.borderColor = UIColor.red
        
        XCTAssertNotNil(button.layer.borderColor)
        XCTAssertEqual(button.layer.borderWidth, 3)
    }
    
    func testCornerRadius() {
        
        let button = AttributedButton()
        button.cornerRadius = 4
        
        XCTAssertEqual(button.layer.cornerRadius, 4)
        XCTAssertTrue(button.layer.masksToBounds)
    }
}
