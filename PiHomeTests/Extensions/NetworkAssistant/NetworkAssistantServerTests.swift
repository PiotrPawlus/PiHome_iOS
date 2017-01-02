//
//  NetworkAssistantServerTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 02/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantServerTests: XCTestCase {
    
    func testConnectToAddressWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().connect(toAddress: "www.example.com") { error in
            
            expectation.fulfill()
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testConnectToAddressWithFailure() {

        MockNetworkAssistant(responseType: .failure).connect(toAddress: "") { error in
            XCTAssertNotNil(error)
        }
    }
}
