//
//  HandTest.swift
//  HandTest
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class HandTest: XCTestCase {
    func test_OnePair () {
        let testCard = [Card.init(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.four, .club), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        var bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.onePair)
    }
    
    func test_TwoPair () {
        let testCard = [Card.init(.two, .spade), Card(.two, .heart), Card(.three, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
       XCTAssertEqual(bestHand[0], Hand.HandRanks.twoPair)
    }
    
    func test_Triple () {
        let testCard = [Card.init(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.three, .heart), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.triple)
    }
    
    func test_FourCard () {
        let testCard = [Card.init(.two, .spade), Card(.two, .heart), Card(.two, .club), Card(.two, .diamond), Card(.eleven, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fourCard)
    }
    
    func test_Straight () {
        let testCard = [Card.init(.two, .spade), Card(.three, .heart), Card(.four, .diamond), Card(.five, .diamond), Card(.six, .diamond), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straight)
    }
    
    func test_FullHouse () {
        let testCard = [Card.init(.two, .spade), Card(.two, .heart), Card(.four, .diamond), Card(.four, .spade), Card(.four, .club), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.fullHouse)
    }
    
    func test_StraightFlush () {
        let testCard = [Card.init(.two, .spade), Card(.three, .spade), Card(.four, .spade), Card(.five, .spade), Card(.six, .spade), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.straightFlush)
    }
    
    func test_RoyalFlush () {
        let testCard = [Card.init(.ace, .spade), Card(.eleven, .spade), Card(.thirteen, .spade), Card(.twelve, .spade), Card(.ten, .spade), Card(.twelve, .spade), Card(.thirteen, .spade)]
        let bestHand = Hand.makeHandRanks(testCard).sorted(by: >)
        XCTAssertEqual(bestHand[0], Hand.HandRanks.royalFlush)
    }
    
    
    
}
