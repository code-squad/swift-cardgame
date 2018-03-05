//
//  HandTest.swift
//  HandTest
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class HandTest: XCTestCase {
    func test_isOnePair() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.four, .club), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.onePair)
    }
    
    func test_onePairAndStraight_isNotOnePair() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.four, .club), Card(.five, .diamond), Card(.six, .spade), Card(.seven, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.onePair)
    }
    
    func test_isTwoPair() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.twoPair)
    }
    
    func test_threeOnePair_isTwoPair() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.eleven, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.twoPair)
    }
    
    func test_isTriple() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.triple)
    }
    
    func test_threeOnePair_isNotTriple() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.three, .heart), Card(.four, .diamond), Card(.four, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.triple)
}
    
    func test_isFourCard() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.two, .diamond), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fourCard)
    }
    
    func test_tripleAndFourCard_isFourCard() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.two, .diamond), Card(.eleven, .diamond), Card(.eleven, .heart), Card(.eleven, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fourCard)
    }
    
    func test_isStraight() {
        let testCard = [Card(.three, .spade), Card(.two, .heart), Card(.four, .diamond), Card(.six, .diamond), Card(.five, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straight)
    }
    
    func test_isNotStraight() {
        let testCard = [Card(.three, .spade), Card(.two, .heart), Card(.four, .diamond), Card(.six, .diamond), Card(.seven, .diamond), Card(.eight, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.straight)
    }
    
    func test_isFlush() {
        let testCard = [Card(.five, .spade), Card(.eight, .spade), Card(.ten, .spade), Card(.twelve, .spade), Card(.six, .spade), Card(.twelve, .diamond), Card(.seven, .club)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.flush)
    }
    
    func test_isNotFlush() {
        let testCard = [Card(.five, .spade), Card(.eight, .spade), Card(.ten, .spade), Card(.twelve, .spade), Card(.six, .club), Card(.twelve, .diamond), Card(.seven, .club)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.flush)
    }
    
    func test_isFullHouse() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.four, .diamond), Card(.four, .spade), Card(.four, .club), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fullHouse)
    }
    
    func test_twoTriple_isNotFullHouse() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.three, .diamond), Card(.three, .spade), Card(.four, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.fullHouse)
    }
    
    func test_tripleAndFourCard_isNotFullHouse() {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.three, .diamond), Card(.three, .club), Card(.three, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.fullHouse)
    }
    
    func test_isStraightFlush() {
        let testCard = [Card(.six, .spade), Card(.two, .spade), Card(.four, .spade), Card(.five, .spade), Card(.three, .spade), Card(.twelve, .diamond), Card(.seven, .club)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straightFlush)
    }
    
    func test_isNotStraightFlush() {
        let testCard = [Card(.six, .spade), Card(.two, .club), Card(.four, .diamond), Card(.five, .spade), Card(.three, .spade), Card(.twelve, .spade), Card(.seven, .diamond)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.straightFlush)
    }
    
    func test_isRoyalFlush() {
        let testCard = [Card(.ace, .spade), Card(.eleven, .spade), Card(.thirteen, .spade), Card(.twelve, .spade), Card(.ten, .spade), Card(.four, .heart), Card(.five, .club)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.royalFlush)
    }
    
    func test_twoTriple_isNotRoyalFlush() {
         let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.three, .diamond), Card(.three, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertNotEqual(bestHand[0], Hand.HandRanks.royalFlush)
    }
    
}
