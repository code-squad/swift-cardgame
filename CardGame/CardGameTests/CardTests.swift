//
//  CardTests.swift
//  CardGameTests
//
//  Created by sungchan.you on 2019/09/27.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardTests: XCTestCase {
    
    func testCard_left_card_win() {
        XCTAssertTrue(Card(rank: .king, suite: .club) > Card(rank: .queen, suite: .club))
        XCTAssertTrue(Card(rank: .jack, suite: .club) > Card(rank: .ten, suite: .diamond))
        XCTAssertTrue(Card(rank: .ten, suite: .club) > Card(rank: .ace, suite: .heart))
    }
    
    func testCard_right_card_win() {
        XCTAssertTrue(Card(rank: .two, suite: .club) < Card(rank: .queen, suite: .club))
        XCTAssertTrue(Card(rank: .seven, suite: .club) < Card(rank: .ten, suite: .diamond))
        XCTAssertTrue(Card(rank: .ten, suite: .club) < Card(rank: .jack, suite: .heart))
    }
    
    func testCard_draw() {
        XCTAssertTrue(Card(rank: .king, suite: .club) == Card(rank: .king, suite: .club))
        XCTAssertTrue(Card(rank: .jack, suite: .club) == Card(rank: .jack, suite: .diamond))
        XCTAssertTrue(Card(rank: .ten, suite: .club) == Card(rank: .ten, suite: .heart))
    }
    
    func testCard_Rank_description_should_not_return_numeric_string() {
        XCTAssertNil(Int(Card.Rank.jack.description))
        XCTAssertNil(Int(Card.Rank.queen.description))
        XCTAssertNil(Int(Card.Rank.king.description))
        XCTAssertNil(Int(Card.Rank.ace.description))
    }
    
    func testCard_Rank_description_should_return_numeric_string() {
        XCTAssertNotNil(Int(Card.Rank.two.description))
        XCTAssertNotNil(Int(Card.Rank.three.description))
        XCTAssertNotNil(Int(Card.Rank.four.description))
    }
    
    func testCard_should_return_description() {
        XCTAssertNotNil(Card(rank: .king, suite: .club))
        XCTAssertNotNil(Card(rank: .two, suite: .spade))
        XCTAssertNotNil(Card(rank: .six, suite: .heart))
    }
}
