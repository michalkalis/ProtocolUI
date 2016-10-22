//
//  TextAlignmentProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension TextAlignment {
    
    var pTextAlignment : NSTextAlignment { return TextAlignmentProtocolTest.testValue }
}

class TextAlignmentProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TextAlignment
    typealias CurrentTestValueType          = NSTextAlignment
    static let testValue : CurrentTestValueType    = NSTextAlignment.right
    
    
    let textAligmnmentFromTextAttributes : ([AnyHashable: Any]?) -> NSTextAlignment? = { attributes in
        
        guard let attributes = attributes else {
            return nil
        }
    
        return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.alignment
    }
    
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributes(for: UIControlState()))
            , type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributes(for: UIControlState()))
            , type(of: self).testValue)
    }
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleLabel?.textAlignment, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleLabel?.textAlignment, type(of: self).testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, type(of: self).testValue)
    }
    
    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, type(of: self).testValue)
    }
    
    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, type(of: self).testValue)
    }
    
    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributes), type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributes), type(of: self).testValue)
    }
    
    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributes(for: UIControlState())), type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributes(for: UIControlState())), type(of: self).testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributes(for: UIControlState())), type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributes(for: UIControlState())), type(of: self).testValue)
    }
    
    
    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.value(forKey: "searchField") as? UITextField)?.textAlignment, type(of: self).testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.value(forKey: "searchField") as? UITextField)?.textAlignment, type(of: self).testValue)
    }
}
