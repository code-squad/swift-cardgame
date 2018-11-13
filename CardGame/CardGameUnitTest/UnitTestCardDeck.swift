//
//  UnitTestCardDeck.swift
//  CardGameUnitTest
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCardDeck: XCTestCase {

    func testInitCardDeckToDefaultStateWell() {
        let cardDeck = CardDeck.init()
        XCTAssertEqual(cardDeck.count(), 52)
    }

    func testRemoveOneCardFromDeck() {
        var cardDeck = CardDeck.init()
        _ = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count(), 51)
    }

}
