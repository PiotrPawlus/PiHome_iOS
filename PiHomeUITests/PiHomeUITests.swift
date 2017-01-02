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

    //BarButtonItems
    
    private var backBarButtonItem: XCUIElement!
    
    //Buttons
    
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

        //BarButtonItems
        
        backBarButtonItem = app.buttons["backBarButtonItem"]
        
        //Buttons
        
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
        
        backBarButtonItem.tap()
        
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
        emailTextField.type(text: "john.little@example.com")
        signInButton.tap()
        
        XCTAssertTrue(passwordAlert.exists)
        
        passwordAlert.confirm()
        passwordTextField.tap() // TO DO - type password and logout
        
        signUpButton.tap()
        backBarButtonItem.tap()
        signUpButton.tap()
        
        firstNameTextField.pressReturn()
        lastNameTextField.pressReturn()
        emailTextField.pressReturn()
        passwordTextField.pressReturn()
        confirmPasswordTextField.pressReturn()
        
        XCTAssertTrue(firstNameAlert.exists)
        
        firstNameAlert.confirm()
        firstNameAlert.tap()
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
    }
    
    //MARK: - Private
    
    //MARK: - Overridden
}
