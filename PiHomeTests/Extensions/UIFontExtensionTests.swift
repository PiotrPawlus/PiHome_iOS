//
//  UIFontExtensionTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//


import XCTest
@testable import PiHome

class UIFontExtensionTests: XCTestCase {
    
    func testHelveticaRegularWithSize() {
        
        let font = UIFont.helveticaRegular(withSize: 12)
        
        XCTAssertEqual(font.fontName, "Helvetica")
        XCTAssertEqual(font.pointSize, 12)
    }
}

