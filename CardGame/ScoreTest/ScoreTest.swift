//
//  ScoreTest.swift
//  ScoreTest
//
//  Created by 김성현 on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class ScoreTest: XCTestCase {

    func testFourOfAKind() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .ace, suit: .spades),
            Card(rank: .ace, suit: .hearts),
            Card(rank: .ace, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .two, suit: .clubs),
            Card(rank: .two, suit: .diamonds),
            Card(rank: .two, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssert(Score(cards: cardsA) < Score(cards: cardsB))
    }
    
    func testThreeOfAKind() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .ace, suit: .spades),
            Card(rank: .ace, suit: .hearts),
            Card(rank: .ace, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .two, suit: .clubs),
            Card(rank: .two, suit: .diamonds),
            Card(rank: .two, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssert(Score(cards: cardsA) < Score(cards: cardsB))
    }


}
