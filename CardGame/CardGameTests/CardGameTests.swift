//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by 공명진 on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCard() {
        let card1 = Card(suit: .spades, rank: .two)
        XCTAssert(card1.suitDescribe() == "♠︎" && card1.rankDescribe() == "2")
        
        let card2 = Card(suit: .diamonds, rank: .king)
        XCTAssert(card2.suitDescribe() == "♦︎" && card2.rankDescribe() == "K")
        
        let card3 = Card(suit: Suit(rawValue: 0)!, rank: .two)
        XCTAssert(card3.suitDescribe() == "♠︎" && card3.rankDescribe() == "2")

    }

}

