//
//  NetworkRequestType.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

enum NetworkRequestType {
    
    case device(Int)
    case devices
    case login(String)
    case register
    case server(String)
    
    var mockResponse: Any {
        
        var mockResponse: Any?
        
        switch self {
        case .device(let identifier):
            
            mockResponse = MockResponse.mockDictionaryForDevice(withIdentifier: identifier, state: true)
            
        case .devices:
            
            mockResponse = [ "devices": [
                    MockResponse.mockDictionaryForDevice(),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 2, type: "light"),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 3, type: "garage"),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 4),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 5)
                ]
            ]
            
        case .login(let email):
        
            if email == "j.l@example.com" {
                mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 2)
            }
            
        case .register:
            
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 3, isAuthorized: false)
            
        case .server(let address):
            
            mockResponse = address == "www.example.com" ? MockResponse.mockDictionaryForServerAddress(withAddress: address) : nil
        }
        
        return mockResponse ?? [:]
    }
}
