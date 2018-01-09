//
//  UnitTestCardGame.swift
//  UnitTestCardGame
//
//  Created by Eunjin Kim on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestCardGame: XCTestCase {
    let pokerPoint = PokerPoint()
//    static let kind = [Spades, Hearts, Diamonds, Clubs]
//    static let kind = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
    func testOnePair() {
        let cardOfOnePair = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Eight), Card(shape: .Diamonds, number: .Six), Card(shape: .Clubs, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfOnePair), 7)
    }
    
    func testTwoPair() {
        let cardOfTwoPair = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Eight), Card(shape: .Diamonds, number: .Seven), Card(shape: .Clubs, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfTwoPair), 57)
    }
    
    func testThrips() {
        let cardOfThrips = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Clubs, number: .Two), Card(shape: .Diamonds, number: .Six), Card(shape: .Clubs, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfThrips), 15)
    }
    
    func testThrips_7stud() {
        let cardOfThrips_7stud = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Clubs, number: .Two), Card(shape: .Diamonds, number: .Six), Card(shape: .Clubs, number: .Seven), Card(shape: .Hearts, number: .Seven), Card(shape: .Diamonds, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfThrips_7stud), 79)
    }
    
    func testStraight() {
        let cardOfStraight = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Three), Card(shape: .Clubs, number: .Four), Card(shape: .Diamonds, number: .Five), Card(shape: .Clubs, number: .Six)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfStraight), 62)
    }
    
    func testStraight_OnePair_7stud() {
        let testStraight_OnePair_7stud = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Three), Card(shape: .Clubs, number: .Four), Card(shape: .Diamonds, number: .Five), Card(shape: .Clubs, number: .Six), Card(shape: .Diamonds, number: .Two), Card(shape: .Clubs, number: .Queen)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: testStraight_OnePair_7stud), 75)
    }
    
    func testNotFlush() {
        let cardOfNotFlush = [Card(shape: .Hearts, number: .Two), Card(shape: .Hearts, number: .Four), Card(shape: .Hearts, number: .Six), Card(shape: .Hearts, number: .Eight), Card(shape: .Diamonds, number: .King)]
        XCTAssertNotEqual(pokerPoint.calculatePokerPoint(cards: cardOfNotFlush), 67)
    }
    
    func testFlush() {
        let cardOfFlush = [Card(shape: .Hearts, number: .Two), Card(shape: .Hearts, number: .Four), Card(shape: .Hearts, number: .Six), Card(shape: .Hearts, number: .Eight), Card(shape: .Hearts, number: .King)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfFlush), 67)
    }
    
    func testFullHouse() {
        let cardOfFullHouse = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Clubs, number: .Two), Card(shape: .Diamonds, number: .Seven), Card(shape: .Clubs, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfFullHouse), 66)
    }
    
    func testQuads() {
        let cardOfQuads = [Card(shape: .Hearts, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Clubs, number: .Two), Card(shape: .Diamonds, number: .Two), Card(shape: .Clubs, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfQuads), 21)
    }
    
    func testStraightFlush() {
        let cardOfStraightFlush = [Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Two), Card(shape: .Spades, number: .Seven)]
        XCTAssertEqual(pokerPoint.calculatePokerPoint(cards: cardOfStraightFlush), 16)
    }
    
}
