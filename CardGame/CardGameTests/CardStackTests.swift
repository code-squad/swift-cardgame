//
//  CardStackTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardStackTests: XCTestCase {
    func test_카드_2개_쌓음() {
        var cardDeck: CardDeck = CardDeck()
        var cardStack: CardStack = CardStack()
        
        for _ in 0..<2 {
            cardStack.pushCard(cardDeck.removeOne())
        }
        
        XCTAssertTrue(cardStack.count() == 2)
        XCTAssertTrue(cardDeck.count() == 50)
    }
}
