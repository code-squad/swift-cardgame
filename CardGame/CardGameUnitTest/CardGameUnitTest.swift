//
//  CardGameUnitTest.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class CardGameUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Make_Suits() {
        let suit = Suits.spade
        XCTAssertNotNil(suit)
    }
    
    func test_Make_Rank() {
        let rank = Rank.Ace
        XCTAssertNotNil(rank)
    }
    
    func test_Make_Card() {
        let suit = Suits.spade
        let rank = Rank.Ace
        let card = Card(suit, rank)
        XCTAssertNotNil(card)
    }
}
