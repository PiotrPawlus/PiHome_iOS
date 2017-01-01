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
        XCTAssertEqual(error.title, "Email")
        
        error = .noDataFound
        XCTAssertEqual(error.title, "No data found")
        
        error = .passwords
        XCTAssertEqual(error.title, "Passwords")
    }
    
    func testNameDescription() {
        
        var error = Error.Name.cannotBeEmpty("title")
        
        XCTAssertNotNil(error.description)
        XCTAssertEqual(error.description, "Cannot be empty.")
        
        error = .email
        XCTAssertEqual(error.description, "Email must be valid.")
        
        error = .noDataFound
        XCTAssertEqual(error.description, "Try again.")
        
        error = .passwords
        XCTAssertEqual(error.description, "Password confirmation and Password must match.")
    }
}

