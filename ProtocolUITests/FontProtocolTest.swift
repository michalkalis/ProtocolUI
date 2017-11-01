//
//  FontProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 19/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension Font {
    
    var pFont : UIFont { return FontProtocolTest.testValue }
}

class FontProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = Font
    typealias CurrentTestValueType          = UIFont
    static let testValue : CurrentTestValueType    = UIFont(name: "Helvetica Neue", size: 15.0)!
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)

    
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }


    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleLabel?.font, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleLabel?.font, type(of: self).testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, type(of: self).testValue)
    }

    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, type(of: self).testValue)
    }

    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, type(of: self).testValue)
    }

    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }

    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSFontAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }
    
    
    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.value(forKey: "searchField") as? UITextField)?.font, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.value(forKey: "searchField") as? UITextField)?.font, type(of: self).testValue)
    }
}
