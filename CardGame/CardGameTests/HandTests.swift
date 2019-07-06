//
//  HandTests.swift
//  CardGameTests
//
//  Created by CHOMINJI on 07/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class HandTests: XCTestCase {
    let ace = Card(suit: .clubs, rank: .ace)
    let two = Card(suit: .clubs, rank: .two)
    let three = Card(suit: .clubs, rank: .three)
    let four = Card(suit: .clubs, rank: .four)
    let five = Card(suit: .spades, rank: .five)
    let six = Card(suit: .clubs, rank: .six)
    let seven = Card(suit: .clubs, rank: .seven)
    let eight = Card(suit: .clubs, rank: .eight)
    let nine = Card(suit: .clubs, rank: .nine)
    let jack = Card(suit: .clubs, rank: .jack)
    let queen = Card(suit: .clubs, rank: .queen)
    let king = Card(suit: .clubs, rank: .king)
    
    func testHighCard() {
        // given
        let cards: [Card] = [ace, two, three, queen, nine]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        let highcard: [Card: CardSetRanking] = [ace: .highcard, two: .highcard, three: .highcard, queen: .highcard, nine: .highcard]
        XCTAssertEqual(HandDecider.decideGeneralHand(of: collectedCards), highcard)
    }
    
    func testOnePair() {
        // given
        let cards: [Card] = [ace, ace, two]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        let onepair: Hands = [ace: .onepair, two: .highcard]
        XCTAssertEqual(HandDecider.decideGeneralHand(of: collectedCards), onepair)
    }
    
    func testTwoPair() {
        // given
        let twopair: Hands = [ace: .onepair, two: .onepair]
        
        // then
        XCTAssertEqual(HandDecider.decideTwoPair(of: twopair), [ace: .twopair, two: .twopair])
    }
    
    func testTriple() {
        // given
        let cards: [Card] = [ace, ace, ace]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        let triple: Hands = [ace: .triple]
        XCTAssertEqual(HandDecider.decideGeneralHand(of: collectedCards), triple)
    }
    
    func testStraight_isSuccess() {
        // given
        let cards: [Card] = [ace, two, three, four, five, eight, nine]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        XCTAssertTrue(HandDecider.decideStraight(of: collectedCards).isStraight)
        XCTAssertEqual(HandDecider.decideStraight(of: collectedCards).maxRank, Card(suit: .clubs, rank: .five))
    }
    
    
    func testStraight_isFail() {
        // given
        let cards: [Card] = [two, three, four, eight, nine, jack, queen]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        XCTAssertFalse(HandDecider.decideStraight(of: collectedCards).isStraight)
    }
    
    func testFourCard() {
        // given
        let cards: [Card] = [ace, ace, ace, ace]
        
        // when
        let collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        
        // then
        let fourcard: Hands = [ace: .fourcard]
        XCTAssertEqual(HandDecider.decideGeneralHand(of: collectedCards), fourcard)
    }
}
