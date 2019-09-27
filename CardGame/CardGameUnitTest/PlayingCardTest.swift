//
//  PlayingCardTest.swift
//  CardGame
//
//  Created by temphee.Reid on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class PlayingCardTest: XCTestCase {
    var suitsPool: [PlayingCard.Suit]!
    var ranksPool: [PlayingCard.Rank]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.suitsPool =  [.spades, .hearts, .diamonds, .clubs]
        self.ranksPool = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PlayingCard_returns_spades_three() {
        let card = PlayingCard(suit: PlayingCard.Suit.spades, rank: PlayingCard.Rank.three)
    
        XCTAssertEqual("♠3", card.Value())
    }
    
    func test_PlayingCard_Rank_toString_jack() {
        let club = PlayingCard.Rank.jack
        
        XCTAssertEqual(club.toString(), "J")
    }
    
    func test_PlayingCard_Rank_toString_ace() {
        let club = PlayingCard.Rank.ace
        
        XCTAssertEqual(club.toString(), "A")
        XCTAssertEqual(club.rawValue, 1)
    }
    
    func test_PlayingCard_Rank_toString_four() {
        let club = PlayingCard.Rank.four
        
        XCTAssertEqual(club.toString(), "4")
        XCTAssertEqual(club.rawValue, 4)
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
