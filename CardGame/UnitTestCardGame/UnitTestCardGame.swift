//
//  UnitTestCardGame.swift
//  UnitTestCardGame
//
//  Created by 김수현 on 2018. 4. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestCardGame: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testBasicCardCount() {
        let cardDeck = CardDeck()
        let cardCount = cardDeck.count()
        XCTAssertTrue(cardCount == 52)
    }
    
}
