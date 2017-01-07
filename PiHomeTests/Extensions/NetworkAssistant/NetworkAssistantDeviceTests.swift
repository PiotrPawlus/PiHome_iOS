//
//  NetworkAssistantDeviceTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantDeviceTests: CoreDataTestCase {
    
    func testDevicesWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        Settings.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        MockNetworkAssistant().devices { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDevicesWithFailure() {
        
        MockNetworkAssistant().devices { error in
            XCTAssertNotNil(error)
        }
    }
}
