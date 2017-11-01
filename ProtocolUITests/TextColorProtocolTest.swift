//
//  TextColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 19/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension TextColor {
    
    var pTextColor : UIColor { return TextColorProtocolTest.testValue }
}

class TextColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TextColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor.yellow
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)

    
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }


    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleColor(for: UIControlState()), type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleColor(for: UIControlState()), type(of: self).testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, type(of: self).testValue)
    }

    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, type(of: self).testValue)
    }

    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, type(of: self).testValue)
    }

    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }

    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes(for: UIControlState())?[NSForegroundColorAttributeName] as? CurrentTestValueType, type(of: self).testValue)
    }


    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.value(forKey: "searchField") as? UITextField)?.textColor, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.value(forKey: "searchField") as? UITextField)?.textColor, type(of: self).testValue)
    }
}
