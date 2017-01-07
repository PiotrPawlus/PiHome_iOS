//
//  UserTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class UserTests: CoreDataTestCase {
    
    func testFullName() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        XCTAssertEqual(user.fullName, "John Little")
    }
    
    func testCreateOrUpdateUserWithDictionary() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        XCTAssertEqual(user.identifier, 1)
        XCTAssertEqual(user.email, "j.l@example.com")
        XCTAssertEqual(user.firstName, "John")
        XCTAssertEqual(user.lastName, "Little")
        XCTAssertEqual(user.authenticationToken, "12345")
        XCTAssertTrue(user.isAuthorized)
    }
    
    func testDelete() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        User.delete(user, in: MagicalRecord.context)

        XCTAssertNil(User.mr_findFirst(byAttribute: "identifier", withValue: user.identifier, in: MagicalRecord.context))
    }
    
    func testFindUserWithIdentifier() {
        
        _ = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        XCTAssertNotNil(User.find(withIdentifier: 1, in: MagicalRecord.context))
    }
}
