//
//  NetworkAssistantTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantTests: XCTestCase {
    
    func testNetworkAssistantInitializer() {
        
        let networkAssistant = NetworkAssistant.shared
        
        XCTAssertNotNil(networkAssistant.requestSerializer)
        XCTAssertTrue(networkAssistant.responseSerializer.acceptableContentTypes!.contains("application/json"))
    }
}
