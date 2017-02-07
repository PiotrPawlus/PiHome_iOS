//
//  DeviceStateButtonTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class DeviceStateButtonTests: XCTestCase {
    
    func testDeviceStateButton() {
        
        let button = DeviceStateButton()
        
        button.deviceState = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.mantis)
        XCTAssertEqual(button.titleLabel?.text, "ON")
        
        button.deviceState = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.red)
        XCTAssertEqual(button.titleLabel?.text, "OFF")
    }
}
