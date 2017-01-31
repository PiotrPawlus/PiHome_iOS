//
//  NetworkAssistantUserTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantUserTests: CoreDataTestCase {
    
    func testAdministrationWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(withIdentifier: 4), in: MagicalRecord.context)
        
        MockNetworkAssistant().administration(for: user) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testAdministrationWithFailure() {

        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(withIdentifier: 4), in: MagicalRecord.context)
        
        MockNetworkAssistant(responseType: .failure).administration(for: user) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testAuthorizationWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(withIdentifier: 5, isAuthorized: false), in: MagicalRecord.context)
        
        MockNetworkAssistant().authorization(for: user) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testAuthorizationWithFailure() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(withIdentifier: 5, isAuthorized: false), in: MagicalRecord.context)
        
        MockNetworkAssistant(responseType: .failure).authorization(for: user) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testLoginWithEmailAndPasswordWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().login(withEmail: "j.l@example.com", password: "") { user, error in
            
            expectation.fulfill()
            
            XCTAssertNotNil(user)
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testLoginWithEmailAndPasswordWithFailure() {
        
        MockNetworkAssistant(responseType: .failure).login(withEmail: "", password: "") { user, error in
            
            XCTAssertNotNil(error)
            XCTAssertNil(user)
        }
    }
    
    func testRegisterWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().register(with: [:]) { user, error in
        
            expectation.fulfill()
            
            XCTAssertNotNil(user)
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testRegisterWithFailure() {
        
        MockNetworkAssistant(responseType: .failure).register(with: [:]) { user, error in
        
            XCTAssertNil(user)
            XCTAssertNotNil(error)
        }
    }
    
    func testUsersWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().users() { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testUsersWithFailure() {
        
        MockNetworkAssistant(responseType: .failure).users() { error in
            XCTAssertNotNil(error)
        }
    }
}
