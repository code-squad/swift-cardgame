//
//  CardDeckTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 11. 27..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@ testable import CardGame

class CardDeckTest: XCTestCase {
    var cardDeck: CardDeck!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        cardDeck = nil
        super.tearDown()
    }

    func testCount() {
        cardDeck = CardDeck()
        XCTAssertEqual(cardDeck.count(), 52)
    }

    func testRemoveOne() {
        cardDeck = CardDeck()
        let deletedCard: String = cardDeck.removeOne().description
        XCTAssertEqual(deletedCard, "♣️K")
        XCTAssertEqual(cardDeck.count(), 51)
        XCTAssertNotEqual(cardDeck[cardDeck.count()-1].description, "♣️K")
    }

    func testShuffle() {
        cardDeck = CardDeck()
        let cardDeck1: CardDeck = cardDeck
        cardDeck.shuffle()
        let cardDeck2: CardDeck = cardDeck
        XCTAssertNotEqual(cardDeck1[cardDeck1.count()-1].description, cardDeck2[cardDeck2.count()-1].description)
    }

    func testReset() {
        cardDeck = CardDeck()
        let cardDeck1: CardDeck = cardDeck
        let deletedCard: String = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count(), 51)
        XCTAssertEqual(deletedCard, "♣️K")
        cardDeck.shuffle()
        cardDeck.reset()
        let cardDeck2: CardDeck = cardDeck
        XCTAssertEqual(cardDeck1[cardDeck1.count()-1].description, cardDeck2[cardDeck2.count()-1].description)
    }

}
