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
        
        XCTAssertTrue(Score(cards: cardsA) < Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) > Score(cards: cardsB))
    }
    
    func testStraight() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .two, suit: .spades),
            Card(rank: .three, suit: .hearts),
            Card(rank: .four, suit: .clubs),
            Card(rank: .five, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .three, suit: .clubs),
            Card(rank: .four, suit: .diamonds),
            Card(rank: .five, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssertTrue(Score(cards: cardsA) < Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) > Score(cards: cardsB))
    }
    
    func testThreeOfAKind() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .five, suit: .spades),
            Card(rank: .ace, suit: .hearts),
            Card(rank: .ace, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .two, suit: .clubs),
            Card(rank: .five, suit: .diamonds),
            Card(rank: .two, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssertTrue(Score(cards: cardsA) < Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) > Score(cards: cardsB))
    }
    
    func testTwoPair() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .ace, suit: .spades),
            Card(rank: .six, suit: .hearts),
            Card(rank: .six, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .two, suit: .clubs),
            Card(rank: .five, suit: .diamonds),
            Card(rank: .five, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssertTrue(Score(cards: cardsA) > Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) < Score(cards: cardsB))
    }
    
    func testOnePair() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .ace, suit: .spades),
            Card(rank: .seven, suit: .hearts),
            Card(rank: .six, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .two, suit: .clubs),
            Card(rank: .eight, suit: .diamonds),
            Card(rank: .five, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        
        XCTAssertTrue(Score(cards: cardsA) < Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) > Score(cards: cardsB))
    }
    
    func testHighCard() {
        let cardsA = [
            Card(rank: .ace, suit: .diamonds),
            Card(rank: .seven, suit: .spades),
            Card(rank: .king, suit: .hearts),
            Card(rank: .six, suit: .clubs),
            Card(rank: .eight, suit: .clubs),
        ]
        
        let cardsB = [
            Card(rank: .two, suit: .spades),
            Card(rank: .seven, suit: .clubs),
            Card(rank: .eight, suit: .diamonds),
            Card(rank: .five, suit: .hearts),
            Card(rank: .six, suit: .clubs),
        ]
        XCTAssertTrue(Score(cards: cardsA) > Score(cards: cardsB))
        XCTAssertFalse(Score(cards: cardsA) < Score(cards: cardsB))
    }

}
