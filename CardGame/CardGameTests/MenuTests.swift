//
//  MenuTests.swift
//  CardGameTests
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MenuTests: XCTestCase {
    
    //Given
    var deck = CardDeck()
    var command: Command!
    
    func testReset() {
        //Given
        command = Reset(deck: self.deck)
        let expected = GameResult.reset(remain: 52)
        
        //When
        let result = command.execute()
        
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testShuffle() {
        //Given
        command = Shuffle(deck: self.deck)
        let expected = GameResult.shuffle(remain: 52)
        //When
        let result = command.execute()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testDraw() {
        //Given
        command = Draw(deck: self.deck)
        
        //When
        let result = command.execute()
        var isSame = false
        
        switch result {
        case .draw(_,51):
            isSame = true
        default:
            ()
        }
        
        //Then
        XCTAssertTrue(isSame)
    }
}
