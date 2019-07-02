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
        let lower = Card.init(suit: .spades, rank: .jack)
        
        //Then
        XCTAssertTrue(higher>lower)
    }
    
    func testCardCompareSameBath() {
        //Given
        let higher = Card.init(suit: .spades, rank: .ace)
        let lower = Card.init(suit: .spades, rank: .jack)
        
        //Then
        XCTAssertTrue(higher>lower)
    }

}
