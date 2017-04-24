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
    
    func testDeviceChangeStateWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        Settings.shared.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant().changeState(of: device) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDeviceChangeStateWithFailure() {
        
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant(responseType: .failure).changeState(of: device) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testCreateDeviceWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        MockNetworkAssistant().createDevice(with: [:]) { error in
        
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testCreateDeviceWithFailure() {
     
        MockNetworkAssistant(responseType: .failure).createDevice(with: [:]) { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testDevicesWithSuccess() {
        
        let expectation = self.expectation(description: "")
        
        Settings.shared.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        MockNetworkAssistant().devices { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testDevicesWithFailure() {
        
        MockNetworkAssistant(responseType: .failure).devices { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testRemoveDeviceWithSuccess() {
        
        let expectation = self.expectation(description: "")
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant().remove(device: device) { error in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testRemoveDeviceWithFailure() {
        
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        MockNetworkAssistant(responseType: .failure).remove(device: device) { error in
            XCTAssertNotNil(error)
        }
    }
}
