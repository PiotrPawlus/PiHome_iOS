//
//  SettingsTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class SettingsTests: CoreDataTestCase {
    
    override func setUp() {
        super.setUp()
        
        if Settings.currentUser != nil {
            Settings.logoutUser()
        }
    }
    
    func testIsUserLoggedIn() {
        
        Settings.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)

        XCTAssertTrue(Settings.isUserLoggedIn)
    }
}
