//
//  ErrorTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class ErrorTests: XCTestCase {
    
    func testNameTitle() {
        
        var error = Error.Name.cannotBeEmpty("title")
        
        XCTAssertNotNil(error.title)
        XCTAssertEqual(error.title, "title")
        
        error = .email
        XCTAssertNotNil(error.title)
    }
    
    func testNameDescription() {
        
        var error = Error.Name.cannotBeEmpty("title")
        
        XCTAssertNotNil(error.description)
        XCTAssertEqual(error.description, "Cannot be empty.")
        
        error = .email
        XCTAssertNotNil(error.description)
    }
}

