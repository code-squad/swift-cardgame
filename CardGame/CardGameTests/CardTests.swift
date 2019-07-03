//
//  CardTests.swift
//  CardGameTests
//
//  Created by 이동영 on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardTests: XCTestCase {

    func testCardCompareSameSuit() {
        //Given
        let higher = Card.init(suit: .spades, rank: .ace)
        let lower = Card.init(suit: .spades, rank: .jack)
        
        //Then
        XCTAssertTrue(higher>lower)
    }
    
    func testCardCompareSameRank() {
        //Given
        let higher = Card.init(suit: .spades, rank: .ace)
        let lower = Card.init(suit: .diamonds, rank: .ace)
        
        //Then
        XCTAssertTrue(higher>lower)
    }
    
    func testCardCompareSameBath() {
        //Given
        let higher = Card.init(suit: .spades, rank: .ace)
        let lower = Card.init(suit: .spades, rank: .ace)
        
        //Then
        XCTAssertTrue(higher==lower)
    }
    
    func testSameRankIsPair() {
        //When
        let sameRankCard = Card.init(suit: .spades, rank: .ace)
        let sameRankCard2 = Card.init(suit: .clubs, rank: .ace)
        
        //Then
        XCTAssertTrue(sameRankCard.isPair(with: sameRankCard2))
    }
    
    func testDiffectRankIsPair() {
        //When
        let sameRankCard = Card.init(suit: .spades, rank: .ace)
        let sameRankCard2 = Card.init(suit: .clubs, rank: .two)
        
        //Then
        XCTAssertFalse(sameRankCard.isPair(with: sameRankCard2))
    }
    
    func testLinkableTrueWithHigherOne() {
        //When
        let card = Card.init(suit: .spades, rank: .ace)
        let higherOne = Card.init(suit: .clubs, rank: .two)
        
        //Then
        XCTAssertTrue(card.isLink(with: higherOne))
    }
    
    func testLinkableTrueWithLowerOne() {
        //When
        let card = Card.init(suit: .spades, rank: .ace)
        let lowerOne = Card.init(suit: .clubs, rank: .king)
        
        //Then
        XCTAssertTrue(card.isLink(with: lowerOne))
    }
    
    func testLinkableFalse() {
        //When
        let sameRankCard = Card.init(suit: .spades, rank: .ace)
        let sameRankCard2 = Card.init(suit: .clubs, rank: .ace)
        
        //Then
        XCTAssertFalse(sameRankCard.isLink(with: sameRankCard2))
    }
    


}
