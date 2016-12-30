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
    
    override func setUp() {
        super.setUp()
        
        User.mr_deleteAll(matching: NSPredicate(value: true), in: MagicalRecord.context)
    }
    
    func testFullName() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        XCTAssertEqual(user.fullName, "John Little")
    }
    
    func testCreateOrUpdateUserWithDictionary() {
        
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        XCTAssertEqual(user.identifier, 1)
        XCTAssertEqual(user.email, "john.little@example.com")
        XCTAssertEqual(user.firstName, "John")
        XCTAssertEqual(user.lastName, "Little")
        XCTAssertEqual(user.authenticationToken, "12345")
    }
    
    func testFindUserWithIdentifier() {
        
        _ = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(), in: MagicalRecord.context)
        
        XCTAssertNotNil(User.find(withIdentifier: 1, in: MagicalRecord.context))
    }
}
