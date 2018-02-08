//
//  HandTest.swift
//  HandTest
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class HandTest: XCTestCase {
    func test_IsOnePair () {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.four, .club), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.onePair)
    }
    
    func test_IsTwoPair () {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
       XCTAssertEqual(bestHand[0], Hand.HandRanks.twoPair)
    }
    
    func test_IsTriple () {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.triple)
    }
    
    func test_IsFourCard () {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.two, .diamond), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fourCard)
    }
    
    func test_IsStraight () {
        let testCard = [Card(.two, .spade), Card(.three, .heart), Card(.four, .diamond), Card(.five, .diamond), Card(.six, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straight)
    }
    
    func test_IsFullHouse () {
        let testCard = [Card(.two, .spade), Card(.two, .heart), Card(.four, .diamond), Card(.four, .spade), Card(.four, .club), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fullHouse)
    }
    
    func test_IsStraightFlush () {
        let testCard = [Card(.two, .spade), Card(.three, .spade), Card(.four, .spade), Card(.five, .spade), Card(.six, .spade), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straightFlush)
    }
    
    func test_IsRoyalFlush () {
        let testCard = [Card(.ace, .spade), Card(.eleven, .spade), Card(.thirteen, .spade), Card(.twelve, .spade), Card(.ten, .spade), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand(testCard).makeHandRanks().sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.royalFlush)
    }
    
}
