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
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.cards.count, 1)
        player.callNewCard(Card.init(suit: .hearts, rank: .ace, upside: false))
        XCTAssertEqual(player.cards.count, 2)
    }

    func testShowDown_none() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.none)
        XCTAssertEqual(player.top, player.cards[6])
    }

    func testShowDown_onePair() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.onePair)
        XCTAssertEqual(player.top, player.cards[3])
    }

    func testShowDown_twoPair() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.twoPair)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_threeOfAKind() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.threeOfAKind)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_straight() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .four, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .six, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .seven, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.straight)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_backStraight() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .two, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .four, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.straight)
        XCTAssertEqual(player.top, player.cards[3])
    }

    func testShowDown_flush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .clubs, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.flush)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_fullHouse() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .jack, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.fullHouse)
        XCTAssertEqual(player.top, player.cards[2])
    }

    func testShowDown_fourOfAKind() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .clubs, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .diamonds, rank: .nine, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.fourOfAKind)
        XCTAssertEqual(player.top, player.cards[5])
    }

    func testShowDown_straightFlush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .four, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .six, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.straightFlush)
        XCTAssertEqual(player.top, player.cards[4])
    }

    func testShowDown_backStraightFlush() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .hearts, rank: .two, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .three, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .four, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .five, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .seven, upside: false))
        player.callNewCard(Card.init(suit: .spades, rank: .king, upside: false))
        player.callNewCard(Card.init(suit: .hearts, rank: .ace, upside: false))
        XCTAssertEqual(player.showDown(), Player.PokerHands.straightFlush)
        XCTAssertEqual(player.top, player.cards[3])
    }

}
