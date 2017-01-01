//
//  NetworkRequestType.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

enum NetworkRequestType {
    
    case login
    case register
    
    var mockResponse: Any {
        
        var mockResponse: Any?
        
        switch self {
        case .login:
            mockResponse = MockResponse.mockDictionaryForUser()
        case .register:
            mockResponse = MockResponse.mockDictionaryForUser()
        }
        
        return mockResponse ?? [:]
    }
}
