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
    
    func testMakeCard() {
        let card = Card.init(Card.Suit.heart, Card.Rank.seven)
        let makeCard = card.makeCard()
        XCTAssert(makeCard == "♥️7")
    }
    
}
