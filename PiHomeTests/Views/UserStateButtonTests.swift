//
//  UserStateButtonTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class UserStateButtonTests: XCTestCase {
    
    func testUserStateButton() {
        
        let button = UserStateButton()
        
        button.isActive = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.red)
        
        button.isActive = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.mantis)
    }
}
