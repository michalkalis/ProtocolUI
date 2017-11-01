//
//  BackgroundImageForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension BackgroundImageForState {
    
    var pBackgroundImageForState : [(UIControlState, UIImage)] { return BackgroundImageForStateProtocolTest.testValue }
}


class BackgroundImageForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = BackgroundImageForState
    typealias CurrentTestValueType          = [(UIControlState, UIImage)]

    static let image1 = UIImage(named: "bob", in: Bundle(for: ImageForStateProtocolTest.self), compatibleWith: nil)!
    static let image2 = UIImage(named: "kevin", in: Bundle(for: ImageForStateProtocolTest.self), compatibleWith: nil)!
    
    static let testValue : CurrentTestValueType    = [
    
        (UIControlState(), ImageForStateProtocolTest.image1), (UIControlState.highlighted, ImageForStateProtocolTest.image2)
    ]
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.backgroundImage(for: UIControlState()), type(of: self).image1)
        XCTAssertEqual(test1.backgroundImage(for: .highlighted), type(of: self).image2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.backgroundImage(for: UIControlState()), type(of: self).image1)
        XCTAssertEqual(test2.backgroundImage(for: .highlighted), type(of: self).image2)
    }
}
