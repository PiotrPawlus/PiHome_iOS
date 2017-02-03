//
//  AttributedBarButtonItemTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 03/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class AttributedBarButtonItemTests: XCTestCase {
    
    func testHiddenTrue() {
        
        let barButtonItem = AttributedBarButtonItem()
        barButtonItem.isHidden = true
        
        XCTAssertFalse(barButtonItem.isEnabled)
        XCTAssertEqual(barButtonItem.tintColor, UIColor.clear)
    }
    
    func testHiddenFalse() {
        
        let barButtonItem = AttributedBarButtonItem()
        barButtonItem.isHidden = false
        
        XCTAssertTrue(barButtonItem.isEnabled)
        XCTAssertNil(barButtonItem.tintColor)
    }
}

