//
//  AttributedNavigationBarTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 01/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class AttributedNavigationBarTests: XCTestCase {
    
    private let attributedNavigationBar = AttributedNavigationBar()
    private let navigationItem = UINavigationItem(title: "title")
    private let leftBarButtonItem = UIBarButtonItem()
    private let rightBarButtonItem = UIBarButtonItem()
    
    override func setUp() {
        super.setUp()
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        attributedNavigationBar.items = [navigationItem]
        attributedNavigationBar.fontSize = 14
    }
    
    func testTitle() {
        
        let title = "Test tilte"
        attributedNavigationBar.title = title
        
        XCTAssertEqual(attributedNavigationBar.topItem?.title, title)
    }
    
    func testFontSizeAndIcomoonLeftBarButtonItems() {
        
        attributedNavigationBar.icomoonLeftBarButtonItems = true
        
        let leftBarButtonItemFont = attributedNavigationBar.topItem?.leftBarButtonItem?.titleTextAttributes(for: .normal)?[NSFontAttributeName] as! UIFont
        
        XCTAssertEqual(leftBarButtonItemFont.fontName, "icomoon")
        XCTAssertEqual(leftBarButtonItemFont.pointSize, 14)
    }
    
    func testFontSizeAndIcomoonRightBarButtonItems() {
        
        attributedNavigationBar.icomoonRightBarButtonItems = true
        
        let rightBarButtonItemFont = attributedNavigationBar.topItem?.rightBarButtonItem?.titleTextAttributes(for: .normal)?[NSFontAttributeName] as! UIFont
        
        XCTAssertEqual(rightBarButtonItemFont.fontName, "icomoon")
        XCTAssertEqual(rightBarButtonItemFont.pointSize, 14)
    }

    func testTransparentBackgroundFalse() {
        
        attributedNavigationBar.transparentBackground = false
        XCTAssertNil(attributedNavigationBar.shadowImage)
        XCTAssertNil(attributedNavigationBar.backgroundImage(for: .default))
    }
    
    func testTransparentBackgroundTrue() {
        
        attributedNavigationBar.transparentBackground = true
        XCTAssertNotNil(attributedNavigationBar.shadowImage)
        XCTAssertNotNil(attributedNavigationBar.backgroundImage(for: .default))
    }
}

