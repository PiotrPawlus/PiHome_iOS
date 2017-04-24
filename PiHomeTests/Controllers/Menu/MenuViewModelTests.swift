//
//  MenuViewModelTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 24/04/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class MenuViewModelTests: XCTestCase {

    private var appContainerMock: AppContainerViewControllerMock!
    private var userInterfaceMock: MenuViewModelOutputMock!
    private var settingsMock: SettingsMock!
    
    private var menuViewModelMock: MenuViewModel!
    
    override func setUp() {
        super.setUp()
        
        appContainerMock = AppContainerViewControllerMock()
        userInterfaceMock = MenuViewModelOutputMock()
        settingsMock = SettingsMock()
        
        menuViewModelMock = MenuViewModel(userInterface: userInterfaceMock, appContainer: appContainerMock, settings: settingsMock)
    }
    
    func testHeightForRowAtUncorrectIndexPath() {
        
        //Arrange
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        //Act
        
        let returnValue = menuViewModelMock.heightForRow(at: indexPath)
        
        //Assert
        
        XCTAssertEqual(returnValue, 50)
    }
    
    func testHeightForRowAtCorrectIndexPathWithoutCurrentUser() {
        
        //Arrange
        
        let indexPath = IndexPath(row: 0, section: 1)
        
        //Act
        
        let returnValue = menuViewModelMock.heightForRow(at: indexPath)
        
        //Assert
        
        XCTAssertEqual(returnValue, 50)
    }
    
    func testHeightForRowAtCorrectIndexPathForNormalUser() {
        
        //Arrange
        
        let indexPath = IndexPath(row: 0, section: 1)
        let userDictionary: [AnyHashable: Any] = [
        
            "authentication_token": "12345",
            "email": "j.l@example.com",
            "id": 1,
            "is_authorized": true,
            "first_name": "John",
            "last_name": "Little",
            "super_user": false
        ]
        
        settingsMock.currentUser = User.createOrUpdate(with: userDictionary, in: MagicalRecord.context)
        
        //Act
        
        let returnValue = menuViewModelMock.heightForRow(at: indexPath)
        
        //Assert
        
        XCTAssertEqual(returnValue, 0)
    }
    
    func testHeightForRowAtCorrectIndexPathForAdministrator() {
        
        //Arrange
        
        let indexPath = IndexPath(row: 0, section: 1)
        let userDictionary: [AnyHashable: Any] = [
            
            "authentication_token": "12345",
            "email": "j.l@example.com",
            "id": 1,
            "is_authorized": true,
            "first_name": "John",
            "last_name": "Little",
            "super_user": true
        ]
        
        settingsMock.currentUser = User.createOrUpdate(with: userDictionary, in: MagicalRecord.context)
        
        //Act
        
        let returnValue = menuViewModelMock.heightForRow(at: indexPath)
        
        //Assert
        
        XCTAssertEqual(returnValue, 50)
    }
    
    func testPrepareViewNotSucceed() {
        
        //Arrange
        
        //Act
        
        menuViewModelMock.prepareView()
        
        //Assert
        
        XCTAssertFalse(userInterfaceMock.updateCalled)
    }
    
    func testPrepareViewSucceed() {
        
        //Arrange
        
        let userDictionary: [AnyHashable: Any] = [
            
            "authentication_token": "12345",
            "email": "j.l@example.com",
            "id": 1,
            "is_authorized": true,
            "first_name": "John",
            "last_name": "Little",
            "super_user": false
        ]
        
        settingsMock.currentUser = User.createOrUpdate(with: userDictionary, in: MagicalRecord.context)
        
        //Act
        
        menuViewModelMock.prepareView()
        
        //Assert
        
        XCTAssertTrue(userInterfaceMock.updateCalled)
    }
}

private class AppContainerViewControllerMock: AppContainerAssistantable {
    
    private(set) var dismissMenuViewControllerCalled = false
    private(set) var dismissMenuViewControllerWithCompletionCalled = false
    private(set) var presentMenuViewControllerCalled = false
    private(set) var setConnectViewControllerCalled = false
    private(set) var setDevicesViewControllerCalled = false
    private(set) var setLoginViewControllerCalled = false
    private(set) var setRegisterViewControllerCalled = false
    private(set) var setUsersViewControllerCalled = false
    
    func dismissMenuViewController() {
        dismissMenuViewControllerCalled = true
    }
    
    func dismissMenuViewController(withCompletion completion: (() -> ())?) {
        dismissMenuViewControllerWithCompletionCalled = true
    }
    
    func presentMenuViewController() {
        presentMenuViewControllerCalled = true
    }
    
    func setConnectViewController() {
        setConnectViewControllerCalled = true
    }
    
    func setDevicesViewController() {
        setDevicesViewControllerCalled = true
    }
    
    func setLoginViewController() {
        setLoginViewControllerCalled = true
    }
    
    func setRegisterViewController() {
        setRegisterViewControllerCalled = true
    }
    
    func setUsersViewController() {
        setUsersViewControllerCalled = true
    }
}

private class MenuViewModelOutputMock: MenuViewModelOutput {
    
    private(set) var updateCalled = false
    
    func update(withUserName userName: String, email: String) {
        updateCalled = true
    }
}

private class SettingsMock: Settingsable {
    
    private(set) var logoutUserCalled = false
    
    var isUserLoggedIn: Bool = false
    var currentUser: User? = nil
    
    func logoutUser() {
        logoutUserCalled = true
    }
}
