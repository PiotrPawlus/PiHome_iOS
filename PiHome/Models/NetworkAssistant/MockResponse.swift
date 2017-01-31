//
//  MockResponse.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class MockResponse {
    
    class func mockDictionaryForDevice(withIdentifier identifier: Int = 1, state: Bool = false, type: String = "gate") -> [AnyHashable: Any] {
        
        return [
            
            "id": identifier,
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            "name": "Gate 11",
            "pin": 11,
            "state": state,
            "type": type
        ]
    }
    
    class func mockDictionaryForUser(withIdentifier identifier: Int = 1, isAuthorized: Bool = true, administrator: Bool = false) -> [AnyHashable: Any] {
        
        return [
            
            "authentication_token": "12345",
            "email": "j.l@example.com",
            "id": identifier,
            "is_authorized": isAuthorized,
            "first_name": "John",
            "last_name": "Little",
            "super_user": administrator
        ]
    }
    
    class func mockDictionaryForServerAddress(withAddress address: String) -> [AnyHashable: Any] {
        
        return [
            "url": address + NetworkAssistantSufixUrl
        ]
    }
}
    
