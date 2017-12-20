//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardGameTests: XCTestCase {
    func test_게임_시작() throws {
        var game = Game(Dealer(CardDeck()))
        try game.start(gameMenu: Game.Menu.fiveCards, playerCount: 5)
        XCTAssertTrue(game.dealer.cardStacks.count == 6)
        XCTAssertTrue(game.dealer.cardDeck.count() == 22)
    }

    func test_게임_인원_초과() throws {
        var game = Game(Dealer(CardDeck()))
        XCTAssertThrowsError(try game.start(gameMenu: Game.Menu.fiveCards, playerCount: 10))
    }
    
}
