//
//  DeviceTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class DeviceTests: CoreDataTestCase {
    
    func testCreateOrUpdateDeviceWithDictionary() {
        
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        XCTAssertEqual(device.identifier, 1)
        XCTAssertEqual(device.information, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        
        XCTAssertEqual(device.name, "Gate 11")
        XCTAssertEqual(device.pin, 11)
        XCTAssertEqual(device.state, false)
        XCTAssertEqual(device.type, "gate")
    }
    
    func testFindUserWithIdentifier() {
        
        _ = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        XCTAssertNotNil(Device.find(withIdentifier: 1, in: MagicalRecord.context))
    }
    
    func testRemoveOrphanedDevicesShouldRemove() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        device.user = user
        
        XCTAssertNotNil(Device.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
        XCTAssertNotNil(User.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
        
        device.user = nil
        
        Device.removeOrphaned(in: MagicalRecord.context)
        
        XCTAssertNil(Device.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
    }

    func testRemoveOrphanedDevicesShouldNotRemove() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        let device = Device.createOrUpdate(with: MockResponse.mockDictionaryForDevice(), in: MagicalRecord.context)
        
        device.user = user
        
        XCTAssertNotNil(Device.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
        XCTAssertNotNil(User.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
        
        Device.removeOrphaned(in: MagicalRecord.context)
        
        XCTAssertNotNil(Device.mr_findFirst(byAttribute: "identifier", withValue: 1, in: MagicalRecord.context))
    }
}

