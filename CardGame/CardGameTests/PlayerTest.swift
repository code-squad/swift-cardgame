//
//  PlayerTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 12. 1..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

@testable import CardGame

class PlayerTest: XCTestCase {
    var player: Player!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        player = nil
        super.tearDown()
    }

    func testInit() {
        player = Player.init(name: "tester")
        XCTAssertEqual(player.name, "tester")
        XCTAssertNil(player.top)
    }

    func testCallNewCard() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        XCTAssertEqual(player.cards.count, 1)
        player.callNewCard(Card.init(suit: .hearts, rank: .ace))
        XCTAssertEqual(player.cards.count, 2)
    }

    func testShowDown_none() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.none)
        XCTAssertEqual(player.top, player.cards[6])
    }

    func testShowDown_onePair() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.onePair)
        XCTAssertEqual(player.top, player.cards[3])
    }

    func testShowDown_twoPair() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.twoPair)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_threeOfAKind() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.threeOfAKind)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_straight() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .four))
        player.callNewCard(Card.init(suit: .hearts, rank: .five))
        player.callNewCard(Card.init(suit: .spades, rank: .six))
        player.callNewCard(Card.init(suit: .clubs, rank: .seven))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.straight)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_backStraight() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .two))
        player.callNewCard(Card.init(suit: .diamonds, rank: .three))
        player.callNewCard(Card.init(suit: .hearts, rank: .four))
        player.callNewCard(Card.init(suit: .spades, rank: .five))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.straight)
        XCTAssertEqual(player.top, player.cards[3])
    }

    func testShowDown_flush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .clubs, rank: .three))
        player.callNewCard(Card.init(suit: .clubs, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack))
        player.callNewCard(Card.init(suit: .clubs, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.flush)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_fullHouse() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .three))
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .jack))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.fullHouse)
        XCTAssertEqual(player.top, player.cards[2])
    }

    func testShowDown_fourOfAKind() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .nine))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine))
        player.callNewCard(Card.init(suit: .diamonds, rank: .nine))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.fourOfAKind)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_straightFlush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .hearts, rank: .four))
        player.callNewCard(Card.init(suit: .hearts, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .six))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.straightFlush)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_backStraightFlush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .two))
        player.callNewCard(Card.init(suit: .hearts, rank: .three))
        player.callNewCard(Card.init(suit: .hearts, rank: .four))
        player.callNewCard(Card.init(suit: .hearts, rank: .five))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven))
        player.callNewCard(Card.init(suit: .spades, rank: .king))
        player.callNewCard(Card.init(suit: .hearts, rank: .ace))
        player.openCards()
        XCTAssertEqual(player.pokerHand, Player.PokerHands.straightFlush)
        XCTAssertEqual(player.top, player.cards[3])
    }

}
