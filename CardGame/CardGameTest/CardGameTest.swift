//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by 심 승민 on 2017. 11. 24..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {
    func testCardInstance() {
        let shape = Shape.clubs
        let number = Number.ace
        let card = Card(shape, number)
        XCTAssertEqual(card.description, "♣️A")
    }
    
}
