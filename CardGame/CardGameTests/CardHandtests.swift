//
//  CardHandtests.swift
//  CardGameTests
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardHandtests: XCTestCase {
    
    //Given
    var hand = CardHand()
    
    override func setUp() {
        hand.append(Card(suit: .clubs, rank: .ace))
    }
    
    func testAppend() {
        //Given
        let before = hand.count()
        
        //When
        hand.append(Card(suit: .hearts, rank: .eight))
        let after = hand.count()
        
        //Then
        XCTAssertEqual(before+1, after)
    }
    
    func testCount() {
        //Given
        let expected = 1
        
        //Then
        let result = hand.count()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testClear() {
        //Given
        let expected = 0
        
        //When
        hand.clear()
        let result = hand.count()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testCompareWithFourcard() {
        
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        //When
        higher.append(Card(suit: .clubs, rank: .ace))
        higher.append(Card(suit: .diamonds, rank: .ace))
        higher.append(Card(suit: .spades, rank: .ace))
        higher.append(Card(suit: .hearts, rank: .ace))
        higher.append(Card(suit: .hearts, rank: .eight))
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        lower.append(Card(suit: .spades, rank: .five))
        lower.append(Card(suit: .hearts, rank: .five))
        lower.append(Card(suit: .hearts, rank: .eight))
        
        //Then
        XCTAssertTrue(higher > lower) // four-card(A) vs four-card(5)
        
    }
    
    func testCompareCaseWithOnePair() {
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        //When
        higher.append(Card(suit: .clubs, rank: .ace))
        higher.append(Card(suit: .diamonds, rank: .ace))
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        
        //Then
        XCTAssertTrue(higher > lower) // one-pair(A) vs one-pair(5)
    }
    
    func testCompareCaseWithEachOther() {
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        //When
        higher.append(Card(suit: .clubs, rank: .two))
        higher.append(Card(suit: .diamonds, rank: .two))
        higher.append(Card(suit: .spades, rank: .two))
      
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        
        //Then
        XCTAssertTrue(higher > lower) // triple(2) vs one-pair(5)
        
    }
    
    func testCompareTwoPair() {
        
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        //When
        higher.append(Card(suit: .clubs, rank: .ace))
        higher.append(Card(suit: .diamonds, rank: .ace))
        higher.append(Card(suit: .spades, rank: .eight))
        higher.append(Card(suit: .hearts, rank: .eight))
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        lower.append(Card(suit: .spades, rank: .king))
        lower.append(Card(suit: .hearts, rank: .king))
        
        //Then
        XCTAssertTrue(higher > lower) // twopair - A vs twopair - K
        
    }
    
    
}
