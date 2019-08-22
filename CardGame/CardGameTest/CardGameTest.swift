//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by 이진영 on 20/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {
    let ace = Card(suit: .clubs, rank: .ace)
    let two = Card(suit: .clubs, rank: .two)
    let three = Card(suit: .clubs, rank: .three)
    let four = Card(suit: .clubs, rank: .four)
    let five = Card(suit: .clubs, rank: .five)
    let six = Card(suit: .clubs, rank: .six)
    let seven = Card(suit: .clubs, rank: .seven)
    let eight = Card(suit: .clubs, rank: .eight)
    let nine = Card(suit: .clubs, rank: .nine)
    let ten = Card(suit: .clubs, rank: .ten)
    let jack = Card(suit: .clubs, rank: .jack)
    let queen = Card(suit: .clubs, rank: .queen)
    let king = Card(suit: .clubs, rank: .king)
    
    func testDealerHaveCard() {
        let cardDeck = CardDeck()
        let dealer = Dealer(cardDeck: cardDeck)
        
        for _ in (0..<cardDeck.count()) {
            XCTAssertNotNil(dealer.give())
        }
    }
    
    func testDealerNoCard() {
        let cardDeck = CardDeck()
        let dealer = Dealer(cardDeck: cardDeck)
        
        for _ in (0..<cardDeck.count()) {
            _ = dealer.give()
        }
        
        XCTAssertNil(dealer.give())
    }
    
    func testPlayer() {
        let player1 = Player(name: "1")
        let player2 = Player(name: "2")
        
        let pairCards = [ace, ace, two, four, six]
        let quadsCards = [three, three, three, three, king]
        
        pairCards.forEach { player1.receive(card: $0) }
        quadsCards.forEach { player2.receive(card: $0) }
        
        XCTAssertTrue(player1 < player2)
        XCTAssertFalse(player1 == player2)
    }
}
