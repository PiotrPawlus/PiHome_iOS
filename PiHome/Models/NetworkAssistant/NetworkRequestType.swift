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
    case server(String)
    
    var mockResponse: Any {
        
        var mockResponse: Any?
        
        switch self {
        case .login, .register:
            mockResponse = MockResponse.mockDictionaryForUser()
        case .server(let address):
            mockResponse = address == "www.example.com" ? MockResponse.mockDictionaryForServerAddress(withAddress: address) : nil
        }
        
        return mockResponse ?? [:]
    }
}
