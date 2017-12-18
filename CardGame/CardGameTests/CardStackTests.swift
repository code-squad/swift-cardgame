//
//  CardStackTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class CardStackTests: XCTestCase {
    func test_카드_3개_가져옴() {
        let cardDeck: CardDeck = CardDeck()
        var cardGame: CardGame = CardGame(cardDeck)
        XCTAssertTrue(try cardGame.setCardStack(3).count() == 2)
        XCTAssertTrue(cardGame.cardDeck.count() == 50)
    }
    
    func test_카드_3개_쌓음() throws {
        let cardDeck: CardDeck = CardDeck()
        var cardGame: CardGame = CardGame(cardDeck)
        var cardStacks: [CardStack] = []
        
        for _ in 0..<3 {
            cardStacks.append(try cardGame.setCardStack(3))
        }
        
        cardGame = CardGame(usingDeck: cardGame.cardDeck, stacks: cardStacks)
        
        XCTAssertTrue(cardGame.cardStacks.count == 3)
        XCTAssertTrue(cardGame.cardDeck.count() == 43)
    }
}
