//
//  UIColorExtensionTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class UIColorExtensionTests: XCTestCase {
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    func testFrenchGray() {
        
        UIColor.frenchGray.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 199/255.0)
        XCTAssertEqual(green, 199/255.0)
        XCTAssertEqual(blue, 204/255.0)
        XCTAssertEqual(alpha, 1)
    }
    
    func testLynch() {
        
        UIColor.lynch.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 101/255.0)
        XCTAssertEqual(green, 117/255.0)
        XCTAssertEqual(blue, 147/255.0)
        XCTAssertEqual(alpha, 1)
    }
    
    func testMantis() {
        
        UIColor.mantis.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 147/255.0)
        XCTAssertEqual(green, 200/255.0)
        XCTAssertEqual(blue, 106/255.0)
        XCTAssertEqual(alpha, 1)
    }
}
