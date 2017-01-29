//
//  CoreDataAssistantDeviceTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class CoreDataAssistatntDeviceTests: CoreDataTestCase {
    
    override func setUp() {
        super.setUp()
        
        Device.mr_deleteAll(matching: NSPredicate(value: true), in: MagicalRecord.context)
    }
    
    func testParseAndSaveDeviceWithCorrectResponse() {
        
        let expectation = self.expectation(description: "")

        CoreDataAssistant.parseAndSaveDevice(with: NetworkRequestType.device.mockResponse) { error in
            
            expectation.fulfill()
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testParseAndSaveDeviceWithIncorrectResponse() {
        
        let expectation = self.expectation(description: "")
        
        CoreDataAssistant.parseAndSaveDevice(with: nil) { error in
            
            expectation.fulfill()
            XCTAssertNotNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testParseAndSaveDevicesWithCorrectResponse() {
        
        let expectation = self.expectation(description: "")
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
    
        CoreDataAssistant.parseAndSaveDevices(with: NetworkRequestType.devices.mockResponse, user: user) { error in
        
            expectation.fulfill()
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 2)
    }
    
    func testParseAndSaveDevicesWithIncorrectResponse() {
        
        CoreDataAssistant.parseAndSaveDevices(with: nil, user: nil) { error in
            XCTAssertNotNil(error)
        }
    }
}
