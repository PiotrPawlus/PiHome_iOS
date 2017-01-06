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
        
        Settings.logoutUser()
        XCTAssertFalse(Settings.isUserLoggedIn)
        
        Settings.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)

        XCTAssertTrue(Settings.isUserLoggedIn)
    }
    
    func testLogoutCurrentUser() {

        Settings.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        Settings.logoutUser()
    
        XCTAssertNil(Settings.currentUser)
    }
}
