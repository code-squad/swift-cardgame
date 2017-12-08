//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by 심 승민 on 2017. 11. 24..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {

    func testCardInstanceOfClubK() {
        let shape = Shape.clubs
        let number = Number.king
        let card = Card(shape, number)
        XCTAssertEqual(card.description, "♣️K")
    }

    func testCardInstanceOfHeart7() {
        let shape = Shape.hearts
        let number = Number.seven
        let card = Card(shape, number)
        XCTAssertEqual(card.description, "♥️7")
    }

    func testCountOfDefaultDeck() {
        let deck = Deck()
        XCTAssertEqual(deck.count, 52)
    }

    func testRemoveCardFromDeck() {
        let deck = Deck()
        deck.shuffle()
        // 5장 뽑은 후 개수 확인.
        for _ in 0..<5 {
            _ = deck.pop()
        }
        XCTAssertEqual(deck.count, 52-5)
    }

    func testOnePair() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.onePair)
    }

    func testOnePair_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.onePair)
    }

    func testTwoPair() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .three), Card(.diamonds, .seven), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.twoPair)
    }

    func testTwoPair_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .three), Card(.diamonds, .seven)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.twoPair)
    }

    func testTriple() {
        let sortedData = [Card(.hearts, .three), Card(.clubs, .three), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.triple)
    }

    func testTriple_5_Stud() {
        let sortedData = [Card(.hearts, .three), Card(.clubs, .three), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.triple)
    }

    func testFourCard() {
        let sortedData = [Card(.hearts, .four), Card(.clubs, .four), Card(.spades, .four), Card(.diamonds, .four), Card(.diamonds, .seven), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.fourCard)
    }

    func testFourCard_5_Stud() {
        let sortedData = [Card(.hearts, .four), Card(.clubs, .four), Card(.spades, .four), Card(.diamonds, .four), Card(.diamonds, .seven)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.fourCard)
    }

    func testFullHouse() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .three), Card(.clubs, .three), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.fullHouse)
    }

    func testFullHouse_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .three), Card(.clubs, .three)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.fullHouse)
    }

    func testStraight() {
        let sortedData = [Card(.hearts, .two), Card(.hearts, .three), Card(.spades, .four), Card(.diamonds, .five), Card(.clubs, .six), Card(.diamonds, .ten), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.straight)
    }

    func testStraight_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.hearts, .three), Card(.spades, .four), Card(.diamonds, .five), Card(.clubs, .six)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.straight)
    }

    func testFlush() {
        let sortedData = [Card(.hearts, .two), Card(.clubs, .two), Card(.hearts, .three), Card(.diamonds, .three), Card(.hearts, .four), Card(.hearts, .ten), Card(.hearts, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.flush)
    }

    func testFlush_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.hearts, .three), Card(.hearts, .four), Card(.hearts, .ten), Card(.hearts, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.flush)
    }

    func testStraightFlush() {
        let sortedData = [Card(.hearts, .two), Card(.hearts, .three), Card(.hearts, .four), Card(.hearts, .five), Card(.hearts, .six), Card(.diamonds, .seven), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.straightFlush)
    }

    func testStraightFlush_5_Stud() {
        let sortedData = [Card(.hearts, .two), Card(.hearts, .three), Card(.hearts, .four), Card(.hearts, .five), Card(.hearts, .six)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.straightFlush)
    }

    func testNoPair() {
        let sortedData = [Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven), Card(.diamonds, .ten), Card(.spades, .king), Card(.spades, .ace)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.noPair)
    }

    func testNoPair_5_Stud() {
        let sortedData = [Card(.clubs, .two), Card(.spades, .three), Card(.diamonds, .four), Card(.diamonds, .seven), Card(.diamonds, .ten)]
        let evaluator = PokerHands(sortedData)
        XCTAssertEqual(evaluator.findBestHand(), PokerHands.HandRanks.noPair)
    }

}
