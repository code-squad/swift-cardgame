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
        XCTAssertEqual(ScoreCalculator.calculateScore(cardStack: cardStack), 4144)
    }
    
    func testOnePairComparison() {
        let onePair1 : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .seven),
                                                          Card.init(suit: .clubs, rank: .seven),
                                                          Card.init(suit: .clubs, rank: .two),
                                                          Card.init(suit: .clubs, rank: .three),
                                                          Card.init(suit: .clubs, rank: .four)])
        
        let onePair2 : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .seven),
                                                          Card.init(suit: .hearts, rank: .seven),
                                                          Card.init(suit: .hearts, rank: .two),
                                                          Card.init(suit: .hearts, rank: .three),
                                                          Card.init(suit: .hearts, rank: .four)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: onePair1) <
            ScoreCalculator.calculateScore(cardStack: onePair2))
    }
    
    func testOnePairTwoPairComparison() {
        let twoPair : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .seven),
                                                         Card.init(suit: .clubs, rank: .seven),
                                                         Card.init(suit: .clubs, rank: .two),
                                                         Card.init(suit: .spades, rank: .two),
                                                         Card.init(suit: .clubs, rank: .four)])
        
        let onePair : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .seven),
                                                         Card.init(suit: .hearts, rank: .seven),
                                                         Card.init(suit: .hearts, rank: .two),
                                                         Card.init(suit: .hearts, rank: .three),
                                                         Card.init(suit: .hearts, rank: .four)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: twoPair) >
            ScoreCalculator.calculateScore(cardStack: onePair))
    }
    
    func testTripleFourCardComparison() {
        let triple : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .seven),
                                                        Card.init(suit: .clubs, rank: .seven),
                                                        Card.init(suit: .spades, rank: .seven),
                                                        Card.init(suit: .spades, rank: .three),
                                                        Card.init(suit: .clubs, rank: .four)])
        
        let fourCard : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .two),
                                                          Card.init(suit: .hearts, rank: .two),
                                                          Card.init(suit: .clubs, rank: .two),
                                                          Card.init(suit: .diamonds, rank: .two),
                                                          Card.init(suit: .hearts, rank: .four)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: triple) <
            ScoreCalculator.calculateScore(cardStack: fourCard))
    }
    
    func testFourCardComparison() {
        let fourCard1 : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .seven),
                                                           Card.init(suit: .clubs, rank: .seven),
                                                           Card.init(suit: .spades, rank: .seven),
                                                           Card.init(suit: .hearts, rank: .seven),
                                                           Card.init(suit: .clubs, rank: .four)])
        
        let fourCard2 : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .two),
                                                           Card.init(suit: .hearts, rank: .two),
                                                           Card.init(suit: .clubs, rank: .two),
                                                           Card.init(suit: .diamonds, rank: .two),
                                                           Card.init(suit: .hearts, rank: .four)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: fourCard1) >
            ScoreCalculator.calculateScore(cardStack: fourCard2))
    }
    
    func testHighCardComparison() {
        let highCard1 : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .two),
                                                           Card.init(suit: .clubs, rank: .three),
                                                           Card.init(suit: .spades, rank: .four),
                                                           Card.init(suit: .hearts, rank: .five),
                                                           Card.init(suit: .clubs, rank: .ten)])
        
        let highCard2 : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .two),
                                                           Card.init(suit: .hearts, rank: .three),
                                                           Card.init(suit: .clubs, rank: .four),
                                                           Card.init(suit: .diamonds, rank: .five),
                                                           Card.init(suit: .hearts, rank: .ten)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: highCard1) <
            ScoreCalculator.calculateScore(cardStack: highCard2))
    }
    
    func testHighCardOnePairComparison() {
        let highCard : CardStack = CardStack.init(cards: [Card.init(suit: .diamonds, rank: .two),
                                                           Card.init(suit: .clubs, rank: .three),
                                                           Card.init(suit: .spades, rank: .four),
                                                           Card.init(suit: .hearts, rank: .five),
                                                           Card.init(suit: .clubs, rank: .ten)])
        
        let onePair : CardStack = CardStack.init(cards: [Card.init(suit: .spades, rank: .two),
                                                           Card.init(suit: .hearts, rank: .two),
                                                           Card.init(suit: .clubs, rank: .four),
                                                           Card.init(suit: .diamonds, rank: .five),
                                                           Card.init(suit: .hearts, rank: .ten)])
        
        XCTAssertTrue(ScoreCalculator.calculateScore(cardStack: highCard) <
            ScoreCalculator.calculateScore(cardStack: onePair))
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
