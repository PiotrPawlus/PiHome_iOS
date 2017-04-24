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
        
        if Settings.shared.currentUser != nil {
            Settings.shared.logoutUser()
        }
    }
    
    func testIsUserLoggedIn() {
        
        Settings.shared.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)

        XCTAssertTrue(Settings.shared.isUserLoggedIn)
    }
}
