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
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 4, pokerRule: .fiveStud)
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : []")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : []")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : []")
        XCTAssertEqual(pokerGame.players[3].description, "참가자#4 : []")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : []")
    }

    func testSetPokerGame() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 4, pokerRule: .fiveStud)
        try! pokerGame.setPokerGame()
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : [♦️K, ♣️A]")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : [♥️K, ♦️A]")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : [♠️K, ♥️A]")
        XCTAssertEqual(pokerGame.players[3].description, "참가자#4 : [♣️Q, ♠️A]")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : [♦️Q, ♣️K]")
    }

    func testNextTurn() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 3, pokerRule: .fiveStud)
        try! pokerGame.nextTurn()
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : [♣️A]")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : [♦️A]")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : [♥️A]")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : [♠️A]")
    }

    func testPlay() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 4, pokerRule: .fiveStud)
        try! pokerGame.setPokerGame()
        try! pokerGame.play(pokerRule: .fiveStud)
        XCTAssertEqual(pokerGame.players[0].description, "참가자#1 : [♣️9, ♠️J, ♥️Q, ♦️K, ♣️A]")
        XCTAssertEqual(pokerGame.players[1].description, "참가자#2 : [♦️9, ♣️10, ♠️Q, ♥️K, ♦️A]")
        XCTAssertEqual(pokerGame.players[2].description, "참가자#3 : [♥️9, ♦️10, ♣️J, ♠️K, ♥️A]")
        XCTAssertEqual(pokerGame.players[3].description, "참가자#4 : [♠️9, ♥️10, ♦️J, ♣️Q, ♠️A]")
        XCTAssertEqual(pokerGame.dealer.description, "dealer : [♣️8, ♠️10, ♥️J, ♦️Q, ♣️K]")
    }

}
