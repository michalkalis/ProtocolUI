//
//  TitleShadowColorForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TitleShadowColorForState {
    
    var pTitleShadowColorForState : [(UIControlState, UIColor)] { return TitleShadowColorForStateProtocolTest.testValue }
}


class TitleShadowColorForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TitleShadowColorForState
    typealias CurrentTestValueType          = [(UIControlState, UIColor)]

    static let color1 = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
    static let color2 = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 0.5)
    
    static let testValue : CurrentTestValueType    = [
    
        (UIControlState(), TitleShadowColorForStateProtocolTest.color1), (UIControlState.highlighted, TitleShadowColorForStateProtocolTest.color2)
    ]
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleShadowColor(for: UIControlState()), type(of: self).color1)
        XCTAssertEqual(test1.titleShadowColor(for: .highlighted), type(of: self).color2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleShadowColor(for: UIControlState()), type(of: self).color1)
        XCTAssertEqual(test2.titleShadowColor(for: .highlighted), type(of: self).color2)
    }
}
