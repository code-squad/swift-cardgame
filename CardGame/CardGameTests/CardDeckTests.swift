//
//  CardDeckTests.swift
//  CardGameTests
//
//  Created by 공명진 on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardDeckTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCardDeckCreate() {
        /* 생성시에는 아래의 모양으로 값이 주어진다.
         [
         Card(spades,ace), ... , Card(spades, king),
         Card(hearts, ace), ... , Card(hearts, king),
         Card(diamonds, ace), ... , Card(diamonds, king),
         Card(clubs, ace), ... , Card(clubs, king)
         ]
         */
        let cardDeck = CardDeck()
        cardDeck.reset()
        
        XCTAssert(cardDeck.count() == Int(52), "\(cardDeck.count())")
        XCTAssert(cardDeck.allCards().first == Card(suit: .spades, rank: .ace))
        XCTAssert(cardDeck.allCards().last == Card(suit: .clubs, rank: .king))
    }
    
    func testCardDeckShuffle() {
        let cardDeck = CardDeck()

        cardDeck.shuffle()
        let card1 = cardDeck.allCards().first

        cardDeck.shuffle()
        let card2 = cardDeck.allCards().first
  
        XCTAssertFalse(card1 == card2)
    }
    
    func testCardRemoveOne() {
        let cardDeck = CardDeck()
        XCTAssertNotNil(cardDeck.removeOne())
    }
    
    func testCardRemoveAll() {
        let cardDeck = CardDeck()
        for _ in 0 ... 52 {
            _ = cardDeck.removeOne()
        }
        XCTAssertNil(cardDeck.removeOne())
    }

}
