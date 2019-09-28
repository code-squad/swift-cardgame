//
/******************************************************************************
 * File Name        : TestCardGame.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import XCTest

class TestCardGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_makeCard() {
        
        let cardByRaw = Card(2, 3)
        XCTAssertNotNil(cardByRaw)
        XCTAssert(cardByRaw?.suit == Suit(rawValue: 2))
        XCTAssert(cardByRaw?.rank == Rank(rawValue: 3))
        
        XCTAssertNil(Card(23, 34))
        
        let suit = Suit.heart
        let rank = Rank.one
        let cardByEnum = Card(suit: suit, rank: rank)
        XCTAssert(cardByEnum.suit == suit)
        XCTAssert(cardByEnum.rank == rank)
        XCTAssert(cardByEnum.description == "❤️A")
    }

}
