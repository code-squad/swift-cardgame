//
//  CardGameUnitTest.swift
//  CardGameUnitTest
//
//  Created by Mrlee on 2017. 12. 5..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import CardGame

class DeckUnitTest: XCTestCase {
    
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
    
    func testRemoveOneCardAndCountRestCards() {
        var deck = Deck()
        _ = deck.removeOne()!
        XCTAssertEqual(deck.count(), 51)
    }
    
    func testPOPStack() {
        var deck = Deck()
        let madeStack = try! deck.makeStack(numberOfCards: 3)
        let clubKCard = Card(suit: 3, rank: 12)
        let clubQCard = Card(suit: 3, rank: 11)
        let clubJCard = Card(suit: 3, rank: 10)
        let testStack = [clubJCard, clubQCard, clubKCard]
        XCTAssertEqual(madeStack, testStack)
    }
    
    func testPOPError() {
        var deck = Deck()
        XCTAssertThrowsError(try deck.makeStack(numberOfCards: 53)) { (error) -> Void in
            XCTAssertEqual(error as? ErrorCode, ErrorCode.zeroCard)
        }
    }
}
