//
//  AttributetTextViewTests.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

import XCTest
@testable import PiHome

class AttributedTextViewTests: XCTestCase {
    
    func testCornerRadius() {
        
        let textView = AttributedTextView()
        textView.cornerRadius = 4
        
        XCTAssertEqual(textView.layer.cornerRadius, 4)
        XCTAssertTrue(textView.layer.masksToBounds)
    }
    
    func testPlaceholder() {
        
        let textView = AttributedTextView()
        textView.placeholder = "Placeholder"
        
        XCTAssertTrue(textView.subviews.first is UILabel)
    }
    
    func testTextViewDidChangeShouldHidePlaceholderLabel() {
        
        let textView = AttributedTextView()
        textView.text = "text"
        textView.placeholder = "Placeholder"
        
        XCTAssertTrue(textView.subviews.first!.isHidden)
    }
    
    func testTextViewDidChangeShouldNotHidePlaceholderLabel() {
        
        let textView = AttributedTextView()
        textView.placeholder = "Placeholder"
        
        XCTAssertFalse(textView.subviews.first!.isHidden)
    }
}
