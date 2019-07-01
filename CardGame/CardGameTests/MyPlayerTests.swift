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
    var hand = CardHand()
    var player:MyPlayer!
    
    override func setUp() {
        self.player = MyPlayer(hand: hand)
    }
    
    func testReceive() {
        //Given
        let before = self.hand.count()
        
        //When
        player.receive(Card.init(suit: .clubs, rank: .ace))
        let after = self.hand.count()

        //Then
        XCTAssertEqual(before+1, after)
    }
    
    func testClearHand() {
        //Given
        let expected = 0
        
        //When
        self.player.clearHand()
        let result = self.hand.count()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
}
