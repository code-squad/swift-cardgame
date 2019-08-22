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
        
        XCTAssertEqual(HandRank.highCard, result.0)
        XCTAssertEqual(four, result.1)
    }
    
    func testPair() {
        let cards = [ace, ace, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertEqual(HandRank.pair, result.0)
        XCTAssertEqual(ace, result.1)
    }
    
    func testTwoPairs() {
        let cards = [ace, ace, three, five, five]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertEqual(HandRank.twoPairs, result.0)
        XCTAssertEqual(five, result.1)
    }

    func testTrips() {
        let cards = [jack, jack, jack, two, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertEqual(HandRank.trips, result.0)
        XCTAssertEqual(jack, result.1)
    }
    
    func testStraight() {
        let cards = [nine, eight, ten, jack, queen]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertEqual(HandRank.straight, result.0)
        XCTAssertEqual(queen, result.1)
    }
    
    func testQuads() {
        let cards = [two, two, two, two]
        let result = RankDeterminer.determineRank(cards: cards)
        
        XCTAssertEqual(HandRank.quads, result.0)
        XCTAssertEqual(two, result.1)
    }
}
