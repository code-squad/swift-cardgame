//
//  MyPlayerTests.swift
//  CardGameTests
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MyPlayerTests: XCTestCase {

    //Given
    let player = MyPlayer()
    
    func testReceive() {
        //Given
        let before = player.showDown().count()
        
        //When
        player.receive(Card.init(suit: .clubs, rank: .ace))
        let after = player.showDown().count()

        //Then
        XCTAssertEqual(before+1, after)
    }
    
    func testClearHand() {
        //Given
        let expected = 0
        
        //When
        player.clearHand()
        let result = player.showDown().count()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
}
