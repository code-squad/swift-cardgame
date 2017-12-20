//
//  CardStackTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardStackTests: XCTestCase {
    func test_카드_5개_쌓음() throws {
        let cardDeck: CardDeck = CardDeck()
        var dealer: Dealer = Dealer(cardDeck)
        try dealer.setCardStacks(5)
        
        XCTAssertTrue(dealer.cardStacks.count == 5)
        XCTAssertTrue(dealer.cardDeck.count() == 37)
    }
    
    func test_카드_10개_쌓음() {
        let cardDeck: CardDeck = CardDeck()
        var dealer: Dealer = Dealer(cardDeck)
        XCTAssertThrowsError(try dealer.setCardStacks(10))
    }
}
