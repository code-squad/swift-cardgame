//
//  UnitTestCard.swift
//  CardGameUnitTest
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCard: XCTestCase {

    func testCardDescription_withNumberRank() {
        let card = Card(suit: .clubs, rank: .eight)
        XCTAssertEqual(card.description, "♣️8")
    }

    func testCardDescription_withClubsAndA() {
        let rank = Rank(rawValue: 1)!
        let card = Card(suit: .clubs, rank: rank)
        XCTAssertEqual(card.description, "♣️A")
    }

    func testCardDescription_withDiamondsAndJ() {
        let rank = Rank(rawValue: 11)!
        let card = Card(suit: .diamonds, rank: rank)
        XCTAssertEqual(card.description, "♦️J")
    }

    func testCardDescription_withHeartsAndQ() {
        let rank = Rank(rawValue: 12)!
        let card = Card(suit: .hearts, rank: rank)
        XCTAssertEqual(card.description, "♥️Q")
    }

    func testCardDescription_withSpadesAndK() {
        let rank = Rank(rawValue: 13)!
        let card = Card(suit: .spades, rank: rank)
        XCTAssertEqual(card.description, "♠️K")
    }

}
