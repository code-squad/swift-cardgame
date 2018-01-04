//
//  DeckTests.swift
//  CardGameTests
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import XCTest

class DeckTests: XCTestCase {
    func test_카드_초기화_성공() {
        let deck: Deck = Deck()
        XCTAssertTrue(deck.count == 52)
    }
    
    func test_카드_하나_뽑기_성공() throws {
        var deck: Deck = Deck()
        try deck.remove()
        XCTAssertTrue(deck.count == 51)
    }
    
    func test_카드_섞기_성공() {
        var deck: Deck = Deck()
        deck.shuffle()
        
        let compareDeck: Deck = Deck()
        XCTAssertTrue(deck != compareDeck)
    }
    
    func test_카드_하나_뽑기_실패() throws {
        var deck: Deck = Deck()
        var cards: [Card] = []
    
        for _ in 0..<deck.count {
            cards.append(try deck.remove())
        }
        
        XCTAssertTrue(cards.count == 52)
        XCTAssertTrue(deck.count == 0)
        XCTAssertThrowsError(try deck.remove())
    }
    
}
