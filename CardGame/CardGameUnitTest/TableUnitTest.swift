//
//  TableUnitTest.swift
//  CardGameUnitTest
//
//  Created by Mrlee on 2017. 12. 7..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class TableUnitTest: XCTestCase {
    let fivePoketOnePlayer = CardGameInfo(typeOf: CardGameInfo.Games.fivePoker, withPlayers: 1)
    func testTableMethod() {
        let deck = Deck()
        let table = Table(gameInfo: fivePoketOnePlayer, with: deck)
        _ = try! table.dealTheCardOfGameTable()
        XCTAssertEqual(table.cardStacksOfTable[0].count, 5)
    }
    // [clubs, hearts, diamonds, spades]
    func testHighCard() {
        let diamond_J = Card(suit: 2, rank: 10)
        let club_Q = Card(suit: 0, rank: 11)
        let club_7 = Card(suit: 0, rank: 6)
        let heart_five = Card(suit: 1, rank: 4)
        let spade_Eight = Card(suit: 3, rank: 7)
        let testStack = [diamond_J, club_Q, club_7, heart_five, spade_Eight]
        var testCalculate = PokerHand()
        XCTAssertEqual(testCalculate.makePokerHandRanking([testStack]).1[0], 13)
    }
    
    func testOnePair() {
        let diamond_J = Card(suit: 2, rank: 10)
        let club_J = Card(suit: 0, rank: 10)
        let spade_J = Card(suit: 3, rank: 10)
        let heart_J = Card(suit: 1, rank: 10)
        let testStack1 = [diamond_J, club_J]
        let testStack2 = [spade_J, heart_J]
        var testCalculate = PokerHand()
//        XCTAssertEqual(testCalculate.registerPointTable([testStack1]).1[0], testCalculate.registerPointTable([testStack2]).1[0])
    }
    
}
