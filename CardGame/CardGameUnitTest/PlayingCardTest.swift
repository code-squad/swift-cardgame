//
//  CardTest.swift
//  CardGame
//
//  Created by temphee.Reid on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardTest: XCTestCase {
    var suitsPool: [Card.Suit]!
    var ranksPool: [Card.Rank]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.suitsPool =  [.spades, .hearts, .diamonds, .clubs]
        self.ranksPool = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Card_returns_spades_three() {
        let card = Card(suit: Card.Suit.spades, rank: Card.Rank.three)
    
        XCTAssertEqual("♠️3", card.description)
    }
    
    func test_Card_Rank_toString_jack() {
        let club = Card.Rank.jack
        
        XCTAssertEqual(club.description, "J")
    }
    
    func test_Card_Rank_toString_ace() {
        let club = Card.Rank.ace
        
        XCTAssertEqual(club.description, "A")
        XCTAssertEqual(club.rawValue, 1)
    }
    
    func test_Card_Rank_toString_four() {
        let club = Card.Rank.four
        
        XCTAssertEqual(club.description, "4")
        XCTAssertEqual(club.rawValue, 4)
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
