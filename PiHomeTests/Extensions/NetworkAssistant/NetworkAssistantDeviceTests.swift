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
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant(responseType: .failure).devices { error in
            
            expectation.fulfill()

            XCTAssertNotNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDeviceChangeStateWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        Settings.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant().changeState(of: device) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDeviceChangeStateWithFailure() {
        
        let expectation = self.expectation(description: "")
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant(responseType: .failure).changeState(of: device) { error in
            
            expectation.fulfill()

            XCTAssertNotNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
}
