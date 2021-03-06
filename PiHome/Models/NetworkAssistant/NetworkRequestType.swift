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
    case newDevice
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
            
            mockResponse = MockResponse.mockDictionaryForDevice(state: 1)
            
        case .devices:
            
            mockResponse = [ "devices": [
                    MockResponse.mockDictionaryForDevice(),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 2),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 3, type: "button"),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 4),
                    MockResponse.mockDictionaryForDevice(withIdentifier: 5, type: "button")
                ]
            ]
            
        case .login(let email):
        
            if email == "j.l@example.com" {
                mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 2, administrator: true)
            }
            
        case .newDevice:
            
            mockResponse = MockResponse.mockDictionaryForDevice(withIdentifier: 6)
            
        case .register:
            
            mockResponse = MockResponse.mockDictionaryForUser(withIdentifier: 3, isAuthorized: false)
            
        case .removeDevice:
            
            mockResponse = nil
            
        case .server(let address):
            
            mockResponse = MockResponse.mockDictionaryForServerAddress(withAddress: address)
            
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
