//
//  HandRankTest.swift
//  CardGameTest
//
//  Created by 이진영 on 22/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class HandRankTest: XCTestCase {
    let ace = Card(suit: .clubs, rank: .ace)
    let two = Card(suit: .clubs, rank: .two)
    let three = Card(suit: .clubs, rank: .three)
    let four = Card(suit: .clubs, rank: .four)
    let five = Card(suit: .clubs, rank: .five)
    let six = Card(suit: .clubs, rank: .six)
    let seven = Card(suit: .clubs, rank: .seven)
    let eight = Card(suit: .clubs, rank: .eight)
    let nine = Card(suit: .clubs, rank: .nine)
    let ten = Card(suit: .clubs, rank: .ten)
    let jack = Card(suit: .clubs, rank: .jack)
    let queen = Card(suit: .clubs, rank: .queen)
    let king = Card(suit: .clubs, rank: .king)
    
    func testHighCard() {
        let cards = [ace, two, three, four]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .highCard, card: four))
    }
    
    func testPair() {
        let cards = [ace, ace, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .pair, card: ace))
    }
    
    func testTwoPairs() {
        let cards = [ace, ace, three, five, five]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .twoPairs, card: five))
    }

    func testTrips() {
        let cards = [jack, jack, jack, two, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .trips, card: jack))
    }
    
    func testStraight() {
        let cards = [nine, eight, ten, jack, queen]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .straight, card: queen))
    }
    
    func testQuads() {
        let cards = [two, two, two, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertTrue(result == Rank(handRank: .quads, card: two))
    }
}
