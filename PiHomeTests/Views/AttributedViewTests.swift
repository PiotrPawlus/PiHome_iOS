//
//  AttributedViewTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 24/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class AttributedViewTests: XCTestCase {

    func testBorderColor() {
        
        let view = AttributedView()
        view.borderColor = UIColor.red
        
        XCTAssertNotNil(view.layer.borderColor)
        XCTAssertEqual(view.layer.borderWidth, 1)
    }
    
    func testBorderWidth() {
        
        let view = AttributedView()
        view.borderWidth = 3
        
        XCTAssertEqual(view.layer.borderWidth, 3)
    }
    
    func testCornerRadius() {
        
        let view = AttributedView()
        view.cornerRadius = 4
        
        XCTAssertEqual(view.layer.cornerRadius, 4)
        XCTAssertTrue(view.layer.masksToBounds)
    }
}
