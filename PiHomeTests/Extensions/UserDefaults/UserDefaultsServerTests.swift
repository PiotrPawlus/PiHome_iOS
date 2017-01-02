//
//  UserDefaultsServerTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class UserDefaultsServerTests: XCTestCase {
    
    func testIsServerAddressTrue() {
        
        UserDefaults.standard.set("www.example.com/api/v1", forKey: NetworkAssistantUrl)
        UserDefaults.standard.synchronize()
        
        XCTAssertTrue(UserDefaults.isServerAddres)
    }
    
    func testIsServerAddressFalse() {
        
        UserDefaults.standard.removeObject(forKey: NetworkAssistantUrl)
        XCTAssertFalse(UserDefaults.isServerAddres)
    }
    
    func testParseAndSaveCurrentUserWithCorrectResponse() {
        
        let expectation = self.expectation(description: "")
            
        UserDefaults.parseAndSaveServerAddress(with: NetworkRequestType.server("www.example.com").mockResponse) { error in
            
            expectation.fulfill()
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testParseAndSaveCurrentUserWithIncorrectResponse() {
        
        UserDefaults.parseAndSaveServerAddress(with: nil) { error in
            XCTAssertNotNil(error)
        }
    }
}
