//
//  CardDeckTests.swift
//  CardGameTests
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardDeckTests: XCTestCase {
    //Given
    var deck = CardDeck()
    
    func testCount() {
        //Then
        XCTAssertEqual(deck.count(),52)
    }
    
    func testRemoveOne() {
        // Given
        let beforeCount = self.deck.count()
        
        //When
        let card = deck.removeOne()!
        let afterCount = self.deck.count()
        
        //Then
        XCTAssertEqual("\(type(of: card))", "Card" )
        XCTAssertEqual(beforeCount, afterCount+1)
    }
    
    func testReset() {
        //When
        _ = deck.removeOne()
        deck.reset()
        //Then
        XCTAssertEqual(deck.count(),52)
    }
}
