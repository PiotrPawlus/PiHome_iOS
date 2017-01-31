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
        
        User.mr_deleteAll(matching: NSPredicate(value: true))
    }
    
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
        XCTAssertEqual(user.authenticationToken, "MTIzNDU6dW51c2Vk")
        XCTAssertTrue(user.isAuthorized)
        XCTAssertFalse(user.administrator)
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
    
    func testRemoveAllUsersInContext() {
        
        let adminUser = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(administrator: true), in: MagicalRecord.context)
        let user = User.createOrUpdate(with: MockResponse.mockDictionaryForUser(withIdentifier: 2), in: MagicalRecord.context)
        
        user.user = adminUser
        
        XCTAssertNotNil(User.find(withIdentifier: 1, in: MagicalRecord.context))
        XCTAssertNotNil(User.find(withIdentifier: 2, in: MagicalRecord.context))
        
        User.removeAll(for: adminUser, in: MagicalRecord.context)
        
        XCTAssertNil(User.find(withIdentifier: 2, in: MagicalRecord.context))
    }
}
