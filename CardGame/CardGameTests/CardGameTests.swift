//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardGameTests: XCTestCase {
    
    func test_Suit_출력() {
        XCTAssertTrue(Suits.club.description == "♣️")
        XCTAssertTrue(Suits.heart.description == "♥️")
        XCTAssertTrue(Suits.diamond.description == "♦️")
        XCTAssertTrue(Suits.spade.description == "♠️")
    }
    
    func test_숫자_출력() {
        XCTAssertTrue(Numbers.ace.description == "A")
        XCTAssertTrue(Numbers.king.description == "K")
        XCTAssertTrue(Numbers.queen.description == "Q")
        XCTAssertTrue(Numbers.jack.description == "J")
        XCTAssertTrue(Numbers.four.description == "4")
    }
}
