//
//  PiHomeUITests.swift
//  PiHomeUITests
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest

class PiHomeUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    //Alerts
    
    private var confirmationPasswordAlert: XCUIElement!
    private var connectAletr: XCUIElement!
    private var emailAlert: XCUIElement!
    private var firstNameAlert: XCUIElement!
    private var lastNameAlert: XCUIElement!
    private var passwordAlert: XCUIElement!
    private var passwordsAlert: XCUIElement!
    private var touchIdAlert: XCUIElement!
    private var unauthorizedAlert: XCUIElement!

    //BarButtonItems
    
    private var backBarButtonItem: XCUIElement!
    private var menuBarButtonItem: XCUIElement!
    
    //Buttons
    
    private var administrateButton: XCUIElement!
    private var authorizeButton: XCUIElement!
    private var connectButton: XCUIElement!
    private var signInButton: XCUIElement!
    private var signUpButton: XCUIElement!
    private var submitButton: XCUIElement!
    
    //TextFields
    
    private var addressTextField: XCUIElement!
    private var confirmPasswordTextField: XCUIElement!
    private var emailTextField: XCUIElement!
    private var firstNameTextField: XCUIElement!
    private var lastNameTextField: XCUIElement!
    private var passwordTextField: XCUIElement!
    
    //TableViews
    
    private var devicesTableView: XCUIElement!
    private var menuTableView: XCUIElement!
    private var usersTableView: XCUIElement!
    
    //TableViewCells
    
    private var devicesTableViewCell: XCUIElement!
    private var logOutTableViewCell: XCUIElement!
    private var usersTableViewCell: XCUIElement!
    
    //StaticText
    
    private var informationStaticText: XCUIElement!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app.launchEnvironment = ["animations": "0"]
        app.launch()
        
        //Alerts
        
        confirmationPasswordAlert = app.alerts["Confirm password"]
        connectAletr = app.alerts["Server Address"]
        emailAlert = app.alerts["Email"]
        firstNameAlert = app.alerts["First Name"]
        lastNameAlert = app.alerts["Last Name"]
        passwordAlert = app.alerts["Password"]
        passwordsAlert = app.alerts["Passwords"]
        touchIdAlert = app.alerts["Touch ID for \"PiHome\""]
        unauthorizedAlert = app.alerts["Please wait..."]

        //BarButtonItems
        
        backBarButtonItem = app.buttons["backBarButtonItem"]
        menuBarButtonItem = app.buttons["menuBarButtonItem"]
        
        //Buttons
        
        administrateButton = app.buttons["administrateButton"]
        authorizeButton = app.buttons["authorizeButton"]
        connectButton = app.buttons["connectButton"]
        signInButton = app.buttons["signInButton"]
        signUpButton = app.buttons["signUpButton"]
        submitButton = app.buttons["submitButton"]
        
        //TextFields
        
        addressTextField = app.textFields["addressTextField"]
        confirmPasswordTextField = app.secureTextFields["confirmPasswordTextField"]
        emailTextField = app.textFields["emailTextField"]
        firstNameTextField = app.textFields["firstNameTextField"]
        lastNameTextField = app.textFields["lastNameTextField"]
        passwordTextField = app.secureTextFields["passwordTextField"]
        
        //TableViews
        
        devicesTableView = app.tables["devicesTableView"]
        menuTableView = app.tables["menuTableView"]
        usersTableView = app.tables["usersTableView"]
        
        //TableViewCells
        
        devicesTableViewCell = menuTableView.cells["devicesTableViewCell"]
        logOutTableViewCell = menuTableView.cells["logOutTableViewCell"]
        usersTableViewCell = menuTableView.cells["usersTableViewCell"]
        
        //StaticText
        
        informationStaticText = app.staticTexts["informationStaticText"]
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func testPiHome() {
        
        connect()
        
        signUpButton.tap()
        backBarButtonItem.tap()
        signUpButton.tap()
        
        register()
        confirmAfterRegister()
        login()
        
        devicesMenu()
        devices()
        usersMenu()
        users()
        logoutMenu()
    }
    
    //MARK: - Private
    
    private func backIfEnabled() {
        
        if backBarButtonItem.exists {
            backBarButtonItem.tap()
        }
    }
    
    private func dismissTouchIdAlertIfExist() {
        
        if touchIdAlert.exists {
            touchIdAlert.cancel()
        }
    }
    
    //MARK: - Connect
    
    private func connect() {
    
        dismissTouchIdAlertIfExist()
        backIfEnabled()
        
        connectButton.tap()
        
        XCTAssertTrue(connectAletr.exists)
        
        connectAletr.confirm()
        addressTextField.pressReturn()
        
        XCTAssertTrue(connectAletr.exists)
        
        connectAletr.confirm()
        addressTextField.tap()
        informationStaticText.tap()
        addressTextField.type(text: "www.example.com")
        connectButton.tap()
        
        backBarButtonItem.tapIfExists()
        addressTextField.type(text: "www.example.com")
        connectButton.tap()
    }
    
    //MARK: - Devices
    
    private func devices() {
        devicesTableView.cells.element(boundBy: 0).buttons["stateButton"].tap()
    }
    
    //MARK: - Login
    
    private func confirmAfterRegister() {
        
        XCTAssertTrue(unauthorizedAlert.exists)
        unauthorizedAlert.confirm()
    }
    
    private func login() {
    
        emailTextField.pressReturn()
        passwordTextField.pressReturn()
        
        XCTAssertTrue(emailAlert.exists)
        
        emailAlert.confirm()
        emailTextField.type(text: "john.little")
        informationStaticText.tap()
        signInButton.tap()
        
        XCTAssertTrue(emailAlert.exists)
        
        emailAlert.confirm()
        emailTextField.clear()
        emailTextField.type(text: "j.l@example.com")
        signInButton.tap()
        
        XCTAssertTrue(passwordAlert.exists)
        
        passwordAlert.confirm()
        passwordTextField.type(text: "Password1")
        signInButton.tap()
    }
    
    //MARK: - Menu
    
    private func devicesMenu() {
        
        menuBarButtonItem.tap()
        devicesTableViewCell.tapIfExists()
    }
    
    private func usersMenu() {
        
        menuBarButtonItem.tap()
        usersTableViewCell.tapIfExists()
    }
    
    private func logoutMenu() {
        
        menuBarButtonItem.tap()
        logOutTableViewCell.tapIfExists()
    }
    
    //MARK: - Register
    
    private func register() {
        
        firstNameTextField.pressReturn()
        lastNameTextField.pressReturn()
        emailTextField.pressReturn()
        passwordTextField.pressReturn()
        confirmPasswordTextField.pressReturn()
        
        XCTAssertTrue(firstNameAlert.exists)
        
        firstNameAlert.confirm()
        firstNameTextField.tap()
        informationStaticText.tap()
        
        firstNameTextField.type(text: "John")
        submitButton.tap()
        
        XCTAssertTrue(lastNameAlert.exists)
        
        lastNameAlert.confirm()
        lastNameTextField.type(text: "Little")
        submitButton.tap()
        
        XCTAssertTrue(emailAlert.exists)
        
        emailAlert.confirm()
        emailTextField.type(text: "john.little")
        submitButton.tap()
        
        XCTAssertTrue(emailAlert.exists)
        
        emailAlert.confirm()
        emailTextField.clear()
        emailTextField.type(text: "john.little@example.com")
        
        submitButton.tap()
        
        XCTAssertTrue(passwordAlert.exists)
        
        passwordAlert.confirm()
        passwordTextField.type(text: "Password1")
        submitButton.tap()
        
        XCTAssertTrue(confirmationPasswordAlert.exists)
        
        confirmationPasswordAlert.confirm()
        confirmPasswordTextField.type(text: "password")
        submitButton.tap()
        
        XCTAssertTrue(passwordsAlert.exists)
        
        passwordsAlert.confirm()
        confirmPasswordTextField.type(text: "Password1")
        submitButton.tap()
    }
    
    //MARK: - Users
    
    private func users() {
        
        usersTableView.tapCell(atIndex: 0)
        authorizeButton.tap()
        administrateButton.tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    //MARK: - Overridden
}
