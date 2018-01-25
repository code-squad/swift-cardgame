//
//  UnitTestCardGame.swift
//  UnitTestCardGame
//
//  Created by YOUTH on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestCardGame: XCTestCase {

    func testStraightFlush() {
        let cards = [
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.four),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.five),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.six)
        ]

        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("flush test sorting :\(stack.sort(order: .Descending))")
        XCTAssertEqual(total, 9000)
    }

    func testFullHouse() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.thirteen)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 9100)
    }

    func testPairWeight_thirteen() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.thirteen)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 1300)
    }

    func testPairWeight_Ace() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.ace),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.ace)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 1400)
    }

    func testTripleWeight_three() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.ace)
        ]
        let stack = CardStack(cards)
        print("sorted: \(cards.sorted())")
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 1200)
    }

    func testNoPair() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.six),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.nine),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.ace),
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.four),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.eleven)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        XCTAssertEqual(total, 14)
    }

    func testFlushWithNoPair() {
        let cards = [
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.five),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.seven),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.six),
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.eleven),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.two)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        XCTAssertEqual(total, 7800)
    }

    func testStraight() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.ace),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.twelve),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.eleven)
        ]
        let stack = CardStack(cards)
        print("ascending \(stack.sort(order: .Ascending))")
        print("descending \(stack.sort(order: .Descending))")
        let total = ScoreChecker().totalScore(cardStack: stack)
        XCTAssertEqual(total, 7000)

    }

    func testFlush() {
        let cards = [
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.five),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.seven),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.eleven),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.six),
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        XCTAssertEqual(total, 6600)
    }

    func testTwoPairs() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.ace),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.ten),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.ace)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 1600)
    }

    func testFullHouseWithOnePair() {
        let cards = [
            Card(suit: CardDeck.Suit.heart, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.two),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.spade, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.thirteen),
            Card(suit: CardDeck.Suit.diamond, denomination:CardDeck.Denomination.three),
            Card(suit: CardDeck.Suit.clover, denomination:CardDeck.Denomination.three)
        ]
        let stack = CardStack(cards)
        let total = ScoreChecker().totalScore(cardStack: stack)
        print("total score: \(total)")
        XCTAssertEqual(total, 9400)
    }
}
