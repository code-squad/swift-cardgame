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
}
