//
//  PokerShowDownTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 12. 4..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import CardGame

class PokerShowDownTest: XCTestCase {
    var pokerShowDown: PokerShowDown!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        pokerShowDown = nil
        super.tearDown()
    }

    func testShowDown_none() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .seven))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.none)
        XCTAssertEqual(showDown.top, cards[6])
    }

    func testShowDown_onePair() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.onePair)
        XCTAssertEqual(showDown.top, cards[3])
    }

    func testShowDown_twoPair() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .king))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.twoPair)
        XCTAssertEqual(showDown.top, cards[5])
    }

    func testShowDown_threeOfAKind() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.threeOfAKind)
        XCTAssertEqual(showDown.top, cards[4])
    }

    func testShowDown_straight() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .four))
        cards.append(Card.init(suit: .hearts, rank: .five))
        cards.append(Card.init(suit: .spades, rank: .six))
        cards.append(Card.init(suit: .clubs, rank: .seven))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.straight)
        XCTAssertEqual(showDown.top, cards[4])
    }

    func testShowDown_backStraight() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .two))
        cards.append(Card.init(suit: .diamonds, rank: .three))
        cards.append(Card.init(suit: .hearts, rank: .four))
        cards.append(Card.init(suit: .spades, rank: .five))
        cards.append(Card.init(suit: .clubs, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.straight)
        XCTAssertEqual(showDown.top, cards[3])
    }

    func testShowDown_flush() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .clubs, rank: .three))
        cards.append(Card.init(suit: .clubs, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .seven))
        cards.append(Card.init(suit: .clubs, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .jack))
        cards.append(Card.init(suit: .clubs, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.flush)
        XCTAssertEqual(showDown.top, cards[5])
    }

    func testShowDown_fullHouse() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .three))
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .jack))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.fullHouse)
        XCTAssertEqual(showDown.top, cards[2])
    }

    func testShowDown_fourOfAKind() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .diamonds, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .nine))
        cards.append(Card.init(suit: .clubs, rank: .nine))
        cards.append(Card.init(suit: .diamonds, rank: .nine))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.fourOfAKind)
        XCTAssertEqual(showDown.top, cards[5])
    }

    func testShowDown_straightFlush() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .hearts, rank: .four))
        cards.append(Card.init(suit: .hearts, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .six))
        cards.append(Card.init(suit: .hearts, rank: .seven))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .spades, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.straightFlush)
        XCTAssertEqual(showDown.top, cards[4])
    }

    func testShowDown_backStraightFlush() {
        var cards: CardPack = []
        cards.append(Card.init(suit: .hearts, rank: .two))
        cards.append(Card.init(suit: .hearts, rank: .three))
        cards.append(Card.init(suit: .hearts, rank: .four))
        cards.append(Card.init(suit: .hearts, rank: .five))
        cards.append(Card.init(suit: .hearts, rank: .seven))
        cards.append(Card.init(suit: .spades, rank: .king))
        cards.append(Card.init(suit: .hearts, rank: .ace))
        pokerShowDown = PokerShowDown.init(cards: cards)
        let showDown: PokerShowDownResult = pokerShowDown.openCards()
        XCTAssertEqual(showDown.pokerHand, PokerShowDown.PokerHands.straightFlush)
        XCTAssertEqual(showDown.top, cards[3])
    }

}
