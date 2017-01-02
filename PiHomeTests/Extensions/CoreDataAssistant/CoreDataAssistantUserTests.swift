//
//  CoreDataAssistantUserTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class CoreDataAssistatntUserTests: XCTestCase {
    
    func testParseAndSaveCurrentUserWithCorrectResponse() {
        
        let expectation = self.expectation(description: "")
        
        CoreDataAssistant.parseAndSaveUser(with: NetworkRequestType.login.mockResponse) { user, error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
            XCTAssertNotNil(user)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testParseAndSaveCurrentUserWithIncorrectResponse() {

        CoreDataAssistant.parseAndSaveUser(with: nil) { user, error in
            
            XCTAssertNil(user)
            XCTAssertNotNil(error)
        }
    }
}
