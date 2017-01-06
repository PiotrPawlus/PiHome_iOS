//
//  NetworkRequestType.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

enum NetworkRequestType {
    
    case login(String)
    case register
    case server(String)
    
    var mockResponse: Any {
        
        var mockResponse: Any?
        
        switch self {
        case .login(let email):
            mockResponse = email == "j.l@example.com" ? MockResponse.mockDictionaryForUser() : nil
        case .register:
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 2, role: "unauthorized")
        case .server(let address):
            mockResponse = address == "www.example.com" ? MockResponse.mockDictionaryForServerAddress(withAddress: address) : nil
        }
        
        return mockResponse ?? [:]
    }
}
