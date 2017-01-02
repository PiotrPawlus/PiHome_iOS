//
//  MockResponse.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class MockResponse {
    
    class func mockDictionaryForUser(withIdentifier identifier: Int = 1) -> [AnyHashable: Any] {
        
        return [
            "authentication_token": "12345",
            "email": "john.little@example.com",
            "id": identifier,
            "first_name": "John",
            "last_name": "Little"
        ]
    }
    
    class func mockDictionaryForServerAddress(withAddress address: String) -> [AnyHashable: Any] {
        
        return [
            "url": address + NetworkAssistantSufixUrl
        ]
    }
}
    
