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
        let card = Card(.clubs, .eight)
        XCTAssertEqual(card.description, "♣️8")
    }

    func testCardDescription_withClubsAndA() {
        let rank = Rank(rawValue: 1)!
        let card = Card(.clubs, rank)
        XCTAssertEqual(card.description, "♣️A")
    }

    func testCardDescription_withDiamondsAndJ() {
        let rank = Rank(rawValue: 11)!
        let card = Card(.diamonds, rank)
        XCTAssertEqual(card.description, "♦️J")
    }

    func testCardDescription_withHeartsAndQ() {
        let rank = Rank(rawValue: 12)!
        let card = Card(.hearts, rank)
        XCTAssertEqual(card.description, "♥️Q")
    }

    func testCardDescription_withSpadesAndK() {
        let rank = Rank(rawValue: 13)!
        let card = Card(.spades, rank)
        XCTAssertEqual(card.description, "♠️K")
    }

}
