//
//  ImageForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ImageForState {
    
    var pImageForState : [(UIControlState, UIImage)] { return ImageForStateProtocolTest.testValue }
}


class ImageForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ImageForState
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
        
        XCTAssertEqual(test1.image(for: UIControlState()), type(of: self).image1)
        XCTAssertEqual(test1.image(for: .highlighted), type(of: self).image2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.image(for: UIControlState()), type(of: self).image1)
        XCTAssertEqual(test2.image(for: .highlighted), type(of: self).image2)
    }
}
