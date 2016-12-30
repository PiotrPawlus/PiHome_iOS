//
//  StringExtensionTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class StringExtensionTests: XCTestCase {
    
    func testIsValidEmailReturnsTrue() {
        
        XCTAssertTrue("bartekss2@gmail.com".isValidEmail)
        XCTAssertTrue("taylor@hou.realtor".isValidEmail)
    }
    
    func testIsMatchingRegularExpressionReturnsTrue() {
        
        let matched = try! "654".isMatching(regularExpression: NSRegularExpression(pattern: "^[1-9]{2,3}$"))
        XCTAssertTrue(matched)
    }
    
    func testIsMatchingRegularExpressionReturnsFalse() {
        
        let matched = try! "6544".isMatching(regularExpression: NSRegularExpression(pattern: "^[1-9]{2,3}$"))
        XCTAssertFalse(matched)
    }
}

