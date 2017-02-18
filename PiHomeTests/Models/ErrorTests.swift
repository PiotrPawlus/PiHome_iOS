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
        XCTAssertEqual(error.title, "email".localized)
        
        error = .noDataFound
        XCTAssertEqual(error.title, "no_data_found".localized)
        
        error = .passwords
        XCTAssertEqual(error.title, "passwords".localized)
        
        error = .touchIdNotAvailable
        XCTAssertEqual(error.title, "touch_id.title".localized)
        
        error = .unauthorized
        XCTAssertEqual(error.title, "please_wait.title".localized)
    }
    
    func testNameDescription() {
        
        var error = Error.Name.cannotBeEmpty("title")
        
        XCTAssertNotNil(error.description)
        XCTAssertEqual(error.description, "cannot_be_empty".localized)
        
        error = .email
        XCTAssertEqual(error.description, "valid_email".localized)
        
        error = .noDataFound
        XCTAssertEqual(error.description, "try_again".localized)
        
        error = .passwords
        XCTAssertEqual(error.description, "passwords_must_match".localized)
        
        error = .touchIdNotAvailable
        XCTAssertEqual(error.description, "touch_id.description".localized)
        
        error = .unauthorized
        XCTAssertEqual(error.description, "please_wait.description".localized)
    }
}

