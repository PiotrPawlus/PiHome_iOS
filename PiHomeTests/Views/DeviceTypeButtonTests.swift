//
//  DeviceTypeButtonTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class DeviceTypeButtonTests: XCTestCase {
    
    func testDeviceTypeButton() {
        
        let button = DeviceTypeButton()
        
        button.isActive = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.white)
        
        button.isActive = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.lynch)
    }
}
