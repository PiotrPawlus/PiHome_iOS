//
//  NetworkAssistantUserTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantUserTests: XCTestCase {
    
    func testLoginWithEmailAndPasswordWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().login(withEmail: "", password: "") { user, error in
            
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
}
