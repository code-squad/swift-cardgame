//
//  WinnerDeterminatorTests.swift
//  CardGameTests
//
//  Created by Daheen Lee on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class WinnerDeterminatorTests: XCTestCase {
    let onePairCards = [Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.king, of: .club)]
    let twoPairCards = [Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.three, of: .club)]
    let highCardsWithSmallerRanks = [Card(.two, of: .club), Card(.six, of: .spade), Card(.ten, of: .heart), Card(.five, of: .diamond), Card(.four, of: .club)]
    let highCardsWithHigherRanks = [Card(.ace, of: .club), Card(.nine, of: .spade), Card(.seven, of: .heart), Card(.queen, of: .diamond), Card(.king, of: .club)]
    var winningPlayer: Player!
    var losingPlayer: Player!
    
    override func setUp() {
        winningPlayer = Participant(number: 1)
        losingPlayer = Participant(number: 2)
    }

    override func tearDown() {
        winningPlayer = nil
        losingPlayer = nil
    }

    func testPlayerWithHigherHandWins() {
        winningPlayer.take(newCards: twoPairCards)
        losingPlayer.take(newCards: onePairCards)
        let decisionOfWinningPlayer = winningPlayer.determineWinningPokerHand()
        let winner = WinnerDeterminator.determineWinner(among: [winningPlayer, losingPlayer])
        let decisionOfWinner = winner.determineWinningPokerHand()
        XCTAssertEqual(decisionOfWinner.hand, decisionOfWinningPlayer.hand)
        XCTAssertEqual(decisionOfWinner.highestRank, decisionOfWinningPlayer.highestRank)
    }

    func testPlayerWithHigherRankWins() {
        winningPlayer.take(newCards: highCardsWithHigherRanks)
        losingPlayer.take(newCards: highCardsWithSmallerRanks)
        let decisionOfWinningPlayer = winningPlayer.determineWinningPokerHand()
        let winner = WinnerDeterminator.determineWinner(among: [winningPlayer, losingPlayer])
        let decisionOfWinner = winner.determineWinningPokerHand()
        XCTAssertEqual(decisionOfWinner.hand, decisionOfWinningPlayer.hand)
        XCTAssertEqual(decisionOfWinner.highestRank, decisionOfWinningPlayer.highestRank)
    }

}
