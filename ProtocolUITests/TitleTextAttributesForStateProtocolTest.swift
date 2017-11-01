//
//  TitleTextAttributesForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TitleTextAttributesForState {
    
    var pTitleTextAttributesForState : [(UIControlState, [String : AnyObject])] { return TitleTextAttributesForStateProtocolTest.testValue }
}


class TitleTextAttributesForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TitleTextAttributesForState
    typealias CurrentTestValueType          = [(UIControlState, [String : AnyObject])]
    
    static let attributes1 : [String : AnyObject] = [
    
        NSAttributedStringKey.font.rawValue : UIFont.boldSystemFont(ofSize: 19),
        NSAttributedStringKey.foregroundColor.rawValue : UIColor.blue
    ]

    static let attributes2 : [String : AnyObject] = [
        
        NSAttributedStringKey.font.rawValue : UIFont.boldSystemFont(ofSize: 21),
        NSAttributedStringKey.foregroundColor.rawValue : UIColor.green
    ]

    
    static let testValue : CurrentTestValueType    = [
        
        (UIControlState(), TitleTextAttributesForStateProtocolTest.attributes1),
        (UIControlState.highlighted, TitleTextAttributesForStateProtocolTest.attributes2)
    ]
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertNotNil(test1.titleTextAttributes(for: UIControlState()))
        let attr1 = NSDictionary(dictionary: test1.titleTextAttributes(for: UIControlState())!)
        let attr2 = NSDictionary(dictionary: type(of: self).attributes1)
        XCTAssertEqual(attr1, attr2)

        XCTAssertNotNil(test1.titleTextAttributes(for: .highlighted))
        let attr11 = NSDictionary(dictionary: test1.titleTextAttributes(for: .highlighted)!)
        let attr22 = NSDictionary(dictionary: type(of: self).attributes2)
        XCTAssertEqual(attr11, attr22)


        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertNotNil(test2.titleTextAttributes(for: UIControlState()))
        let attr111 = NSDictionary(dictionary: test1.titleTextAttributes(for: UIControlState())!)
        let attr222 = NSDictionary(dictionary: type(of: self).attributes1)
        XCTAssertEqual(attr111, attr222)
        
        XCTAssertNotNil(test2.titleTextAttributes(for: .highlighted))
        let attr1111 = NSDictionary(dictionary: test1.titleTextAttributes(for: .highlighted)!)
        let attr2222 = NSDictionary(dictionary: type(of: self).attributes2)
        XCTAssertEqual(attr1111, attr2222)
    }
    
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertNotNil(test1.titleTextAttributes(for: UIControlState()))
        let attr1 = NSDictionary(dictionary: test1.titleTextAttributes(for: UIControlState())!)
        let attr2 = NSDictionary(dictionary: type(of: self).attributes1)
        XCTAssertEqual(attr1, attr2)
        
        XCTAssertNotNil(test1.titleTextAttributes(for: .highlighted))
        let attr11 = NSDictionary(dictionary: test1.titleTextAttributes(for: .highlighted)!)
        let attr22 = NSDictionary(dictionary: type(of: self).attributes2)
        XCTAssertEqual(attr11, attr22)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertNotNil(test2.titleTextAttributes(for: UIControlState()))
        let attr111 = NSDictionary(dictionary: test1.titleTextAttributes(for: UIControlState())!)
        let attr222 = NSDictionary(dictionary: type(of: self).attributes1)
        XCTAssertEqual(attr111, attr222)
        
        XCTAssertNotNil(test2.titleTextAttributes(for: .highlighted))
        let attr1111 = NSDictionary(dictionary: test1.titleTextAttributes(for: .highlighted)!)
        let attr2222 = NSDictionary(dictionary: type(of: self).attributes2)
        XCTAssertEqual(attr1111, attr2222)
    }

}
