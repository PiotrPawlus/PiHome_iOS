//
//  CoreDataAssistantUserTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class CoreDataAssistatntUserTests: CoreDataTestCase {
    
    func testLogOutCurrentUserWithSuccess() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        XCTAssertNotNil(User.find(withIdentifier: 1))
    
        let expectation = self.expectation(description: "")

        CoreDataAssistant.logOut(user) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testLogOutCurrentUserWithFailure() {
        
        CoreDataAssistant.logOut(nil) { error in
            
            XCTAssertNotNil(error)
            XCTAssertNil(Settings.currentUser)
        }
    }
    
    func testParseAndSaveCurrentUserWithCorrectResponse() {
        
        let expectation = self.expectation(description: "")
        
        CoreDataAssistant.parseAndSaveUser(with: NetworkRequestType.login("j.l@example.com").mockResponse) { user, error in
            
            expectation.fulfill()
            XCTAssertNotNil(user)
            XCTAssertNil(error)
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
