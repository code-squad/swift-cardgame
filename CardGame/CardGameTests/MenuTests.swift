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
    var menu: Menu!
    
    func testReset() {
        //Given
        menu = Reset()
        let expected = GameResult.reset(remain: 52)
        
        //When
        let result = menu.action(cards: self.deck)
        
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testShuffle() {
        //Given
        menu = Shuffle()
        let expected = GameResult.shuffle(remain: 52)
        //When
        let result = menu.action(cards: self.deck)
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testDraw() {
        //Given
        menu = Draw()
        
        //When
        let result = menu.action(cards: self.deck)
        var same = false
        
        switch result {
        case .draw(_,51):
            same = true
        default:
            ()
        }
        
        //Then
        XCTAssertTrue(same)
    }
}
