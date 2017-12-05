//
//  CardGameUnitTest.swift
//  CardGameUnitTest
//
//  Created by Mrlee on 2017. 12. 5..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import CardGame

class CardGameUnitTest: XCTestCase {
    
    func testInitalCardDeckHave52Cards() {
        let deck = Deck()
        XCTAssertEqual(deck.count(), 52)
    }
    
    func testRemoveOneCardisClubK() {
        var deck = Deck()
        let card = deck.removeOne()!
        let testCard = Card(suit: 3, rank: 12)
        XCTAssertEqual(card, testCard)
    }
    
    func testRemveOneCardAndCountRestCards() {
        var deck = Deck()
        _ = deck.removeOne()!
        XCTAssertEqual(deck.count(), 51)
    }
}
