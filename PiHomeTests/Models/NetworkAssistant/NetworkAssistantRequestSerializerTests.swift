//
//  NetworkAssistantRequestSerializerTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class NetworkAssistantRequestSerializerTests: CoreDataTestCase {
    
    func testRequestBySerializingRequestWithParameters() {
        
        let requestSerializer = NetworkAssistantRequestSerializer()
        let urlRequest = URLRequest(url: URL(string: "www.domain.com")!)
        var error: NSError?
        let serializedUrlRequest = requestSerializer.request(bySerializingRequest: urlRequest, withParameters: ["a": "b"], error: &error)
        
        XCTAssertTrue(serializedUrlRequest!.url!.absoluteString.contains("www.domain.com?a=b"))
    }
    
    func testRequestBySerializingRequestWithoutParameters() {
        
        let requestSerializer = NetworkAssistantRequestSerializer()
        let urlRequest = URLRequest(url: URL(string: "www.domain.com")!)
        var error: NSError?
        let serializedUrlRequest = requestSerializer.request(bySerializingRequest: urlRequest, withParameters: nil, error: &error)
        
        XCTAssertTrue(serializedUrlRequest!.url!.absoluteString.contains("www.domain.com?timestamp"))
    }
    
    func testRequestBySerializingRequestHeaders() {
        
        Settings.shared.currentUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        let requestSerializer = NetworkAssistantRequestSerializer()
        let urlRequest = URLRequest(url: URL(string: "www.domain.com")!)
        var error: NSError?
        let serializedUrlRequest = requestSerializer.request(bySerializingRequest: urlRequest, withParameters: nil, error: &error)
        
        XCTAssertTrue(serializedUrlRequest!.url!.absoluteString.contains("www.domain.com?timestamp"))
        XCTAssertEqual(serializedUrlRequest!.value(forHTTPHeaderField: "Authorization"), "Basic MTIzNDU6dW51c2Vk")
    }
}
