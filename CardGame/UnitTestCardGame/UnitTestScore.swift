//
//  UnitTestDeck.swift
//  UnitTestCardGame
//
//  Created by 조재흥 on 18. 12. 9..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest
@testable import CardGame

class UnitTestDeck: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScore() {
        let cardStack : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .A),
                                                           Card.init(suit: .hearts, rank: .A),
                                                           Card.init(suit: .diamonds, rank: .A),
                                                           Card.init(suit: .clubs, rank: .A),
                                                           Card.init(suit: .hearts, rank: .six)])
        XCTAssertEqual(cardStack.score(), 4144)
    }
    
    func testScore2() {
        let cardStack : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .six),
                                                           Card.init(suit: .hearts, rank: .six),
                                                           Card.init(suit: .diamonds, rank: .seven),
                                                           Card.init(suit: .clubs, rank: .seven),
                                                           Card.init(suit: .hearts, rank: .ten)])
        
        let cardStack2 : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .ten),
                                                            Card.init(suit: .hearts, rank: .ten),
                                                            Card.init(suit: .diamonds, rank: .six),
                                                            Card.init(suit: .clubs, rank: .seven),
                                                            Card.init(suit: .hearts, rank: .nine)])
        
        XCTAssertTrue(cardStack.score() > cardStack2.score())
    }
    
    func testScore3() {
        let cardStack : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .six),
                                                           Card.init(suit: .hearts, rank: .six),
                                                           Card.init(suit: .spades, rank: .seven),
                                                           Card.init(suit: .clubs, rank: .seven),
                                                           Card.init(suit: .hearts, rank: .ten)])
        
        let cardStack2 : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .four),
                                                            Card.init(suit: .hearts, rank: .four),
                                                            Card.init(suit: .diamonds, rank: .seven),
                                                            Card.init(suit: .clubs, rank: .seven),
                                                            Card.init(suit: .hearts, rank: .nine)])
        
        XCTAssertTrue(cardStack.score() > cardStack2.score())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
