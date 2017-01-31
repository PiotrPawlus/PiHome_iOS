//
//  NetworkRequestType.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

enum NetworkRequestType {
    
    case administration
    case authorization
    case device
    case devices
    case login(String)
    case register
    case removeDevice
    case server(String)
    case users
    
    var mockResponse: Any {
        
        var mockResponse: Any?
        
        switch self {
        case .administration:
            
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 4, administrator: true)
            
        case .authorization:
            
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 5, isAuthorized: true)
            
        case .device:
            
            mockResponse = MockResponse.mockDictionaryForDevice(state: true)
            
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
                mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 2, administrator: true)
            }
            
        case .register:
            
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 3, isAuthorized: false)
            
        case .removeDevice:
            
            mockResponse = nil
            
        case .server(let address):
            
            mockResponse = address == "www.example.com" ? MockResponse.mockDictionaryForServerAddress(withAddress: address) : nil
            
        case .users:
            
            mockResponse = [
             
                "users": [
                
                    MockResponse.mockDictionaryForUser(),
                    MockResponse.mockDictionaryForUser(withIdentifier: 2, administrator: true),
                    MockResponse.mockDictionaryForUser(withIdentifier: 3, isAuthorized: false),
                    MockResponse.mockDictionaryForUser(withIdentifier: 4, administrator: true)
                ]
            ]
        }
        
        return mockResponse ?? [:]
    }
}
