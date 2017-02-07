//
//  StateViewTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 07/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class StateViewTests: XCTestCase {
    
    func testStateView() {
        
        let view = StateView()
        
        view.isActive = false
        
        XCTAssertEqual(view.backgroundColor, UIColor.white)
        
        view.isActive = true
        
        XCTAssertEqual(view.backgroundColor, UIColor.lynch)
    }
}
