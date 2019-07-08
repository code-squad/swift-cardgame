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
    var winingDealer: Dealer!
    var losingParticipant: Participant!
    

    override func setUp() {
        winingDealer = Dealer()
        losingParticipant = Participant()
    }

    override func tearDown() {
        winingDealer = nil
        losingParticipant = nil
    }

    func testPlayerWithHigherHandWins() {
        winingDealer.take(newCards: twoPairCards)
        losingParticipant.take(newCards: onePairCards)
        let players = Players(dealer: winingDealer, participants: [losingParticipant])
        let nameOfWinner = players.determineWinner()
        XCTAssertEqual(nameOfWinner, winingDealer.role)
    }

    func testPlayerWithHigherRankWinds() {
        winingDealer.take(newCards: highCardsWithHigherRanks)
        losingParticipant.take(newCards: highCardsWithSmallerRanks)
        let players = Players(dealer: winingDealer, participants: [losingParticipant])
        let nameOfWinner = players.determineWinner()
        XCTAssertEqual(nameOfWinner, winingDealer.role)
    }
}
