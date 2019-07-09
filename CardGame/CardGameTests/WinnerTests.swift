//
//  WinnerTests.swift
//  CardGameTests
//
//  Created by Daheen Lee on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class WinnerTests: XCTestCase {
    let onePairCards = Cards([Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.king, of: .club)])
    let twoPairCards = Cards([Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.three, of: .club)])
    let highCardsWithSmallerRanks = Cards([Card(.two, of: .club), Card(.six, of: .spade), Card(.ten, of: .heart), Card(.five, of: .diamond), Card(.four, of: .club)])
    let highCardsWithHigherRanks = Cards([Card(.ace, of: .club), Card(.nine, of: .spade), Card(.seven, of: .heart), Card(.queen, of: .diamond), Card(.king, of: .club)])
    var winner: Player!
    var loser: Player!
    

    override func setUp() {
        winner = Player()
        loser = Player()
    }

    override func tearDown() {
        winner = nil
        loser = nil
    }

    func testPlayerWithHigherHandWins() {
        winner.take(newCards: twoPairCards)
        loser.take(newCards: onePairCards)
        XCTAssertTrue(winner > loser)
    }

    func testPlayerWithHigherRankWinds() {
        winner.take(newCards: highCardsWithHigherRanks)
        loser.take(newCards: highCardsWithSmallerRanks)
        XCTAssertTrue(winner > loser)
    }
}
