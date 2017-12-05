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
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : []\n참가자#2 : []\n참가자#3 : []\n참가자#4 : []\ndealer : []")
    }

    func testSetPokerGame() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 4, pokerRule: .fiveStud)
        XCTAssertTrue(pokerGame.setPokerGame())
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : [♦️K, ♣️A]\n참가자#2 : [♥️K, ♦️A]\n참가자#3 : [♠️K, ♥️A]\n참가자#4 : [♣️Q, ♠️A]\ndealer : [♦️Q, ♣️K]")
    }

    func testNextTurn() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 3, pokerRule: .fiveStud)
        XCTAssertTrue(pokerGame.nextTurn())
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : [♣️A]\n참가자#2 : [♦️A]\n참가자#3 : [♥️A]\ndealer : [♠️A]")
    }

    func testPlay() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 4, pokerRule: .fiveStud)
        XCTAssertTrue(pokerGame.setPokerGame())
        XCTAssertTrue(pokerGame.play())
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : [♣️9, ♠️J, ♥️Q, ♦️K, ♣️A]\n참가자#2 : [♦️9, ♣️10, ♠️Q, ♥️K, ♦️A]\n참가자#3 : [♥️9, ♦️10, ♣️J, ♠️K, ♥️A]\n참가자#4 : [♠️9, ♥️10, ♦️J, ♣️Q, ♠️A]\ndealer : [♣️8, ♠️10, ♥️J, ♦️Q, ♣️K]")
    }

    func testShowPokerTable() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 1, pokerRule: .fiveStud)
        XCTAssertTrue(pokerGame.setPokerGame())
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : [♣️A, ♥️A]\ndealer : [♦️A, ♠️A]")
    }

    func testShowWinner() {
        pokerGame = PokerGame.init(dealerAction: DealerAction(), playerCount: 1, pokerRule: .fiveStud)
        XCTAssertTrue(pokerGame.setPokerGame())
        XCTAssertTrue(pokerGame.play())
        XCTAssertEqual(pokerGame.showPokerTable(), "참가자#1 : [♣️Q, ♣️K, ♥️K, ♣️A, ♥️A]\ndealer : [♦️Q, ♦️K, ♠️K, ♦️A, ♠️A]")
        XCTAssertEqual(pokerGame.showWinner(), "참가자#1 -> twoPair, top: ♥️A\ndealer -> twoPair, top: ♠️A\nWinner!!! : dealer -> twoPair, top: ♠️A")
    }

}
