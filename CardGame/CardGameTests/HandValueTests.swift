//
//  HandValueTests.swift
//  CardGameTests
//
//  Created by sungchan.you on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class HandValueTests: XCTestCase {

    func testHandValue_FourCard_bigger_than_Straight() {
        XCTAssertTrue(HandValue.straight < HandValue.fourCard)
    }
    
    func testHandValue_Straight_bigger_than_Triple() {
        XCTAssertTrue(HandValue.straight > HandValue.triple)
    }
    
    func testHandValue_TwoPairs_bigger_than_Pair() {
        XCTAssertTrue(HandValue.twoPairs > HandValue.pair)
    }
    
    func testHandValue_TwoPairs_is_same_as_TwoPairs() {
        XCTAssertTrue(HandValue.twoPairs == HandValue.twoPairs)
    }
}
