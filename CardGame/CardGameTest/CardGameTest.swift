//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by 이진영 on 20/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {
    func testDealerHaveCard() {
        let cardDeck = CardDeck()
        let dealer = Dealer(cardDeck: cardDeck)
        
        for _ in (0..<cardDeck.count()) {
            XCTAssertNotNil(dealer.give())
        }
    }
    
    func testDealerNoCard() {
        let cardDeck = CardDeck()
        let dealer = Dealer(cardDeck: cardDeck)
        
        for _ in (0..<cardDeck.count()) {
            _ = dealer.give()
        }
        
        XCTAssertNil(dealer.give())
    }
}
