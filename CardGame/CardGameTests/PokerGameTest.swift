//
//  PokerGameTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import CardGame

class PokerGameTest: XCTestCase {
    var pokerGame: PokerGame!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPokerGame() {
        pokerGame = PokerGame.init(cardDeck: CardDeck(), playerCount: 4, pokerRule: .fiveStud)
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : []")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : []")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : []")
        XCTAssertEqual(pokerGame.players[3].description, "참가자#4 : []")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : []")
    }

    func testNextTurn() {
        pokerGame = PokerGame.init(cardDeck: CardDeck(), playerCount: 3, pokerRule: .fiveStud)
        try! pokerGame.nextTurn()
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : [♣️A]")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : [♦️A]")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : [♥️A]")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : [♠️A]")
    }

}
