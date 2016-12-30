//
//  SettingsTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class SettingsTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        
        Settings.logoutUser()
    }
    
    func testIsUserLoggedIn() {
        
    }
    
    func testLogoutCurrentUser() {
        
    }
}
