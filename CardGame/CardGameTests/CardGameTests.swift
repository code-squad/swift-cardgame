//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTests: XCTestCase {
    
    let ace = Card(suit: .clubs, rank: .ace)
    let two = Card(suit: .clubs, rank: .two)
    let three = Card(suit: .clubs, rank: .three)
    let four = Card(suit: .clubs, rank: .four)
    let five = Card(suit: .spades, rank: .five)
    let six = Card(suit: .clubs, rank: .six)
    let seven = Card(suit: .clubs, rank: .seven)
    let eight = Card(suit: .clubs, rank: .eight)
    let nine = Card(suit: .clubs, rank: .nine)
    let ten = Card(suit: .clubs, rank: .ten)
    let jack = Card(suit: .clubs, rank: .jack)
    let queen = Card(suit: .clubs, rank: .queen)
    let king = Card(suit: .clubs, rank: .king)
    
    func testPlayersRank() {
        let cards = [jack, jack, queen]
        let cards2 = [queen, queen, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
       XCTAssertTrue(player1 < player2)
        XCTAssertFalse(player1 > player2)
    }
    
    func testWinner_whenPlayersHaveDifferentCard() {
        let onepair = [ace, ace, two, five, six]
        let twopair = [ace, ace, two, two , five]
        let triple = [ace, ace, ace, two, seven]
        let straight = [ace, two, three, four, five]
        let fourcard = [ace, ace, ace, ace, jack]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        let player3 = Player(order: 3)
        let player4 = Player(order: 4)
        let player5 = Player(order: 5)
        
        onepair.forEach { player1.take(card: $0) }
        twopair.forEach { player2.take(card: $0) }
        triple.forEach { player3.take(card: $0) }
        straight.forEach { player4.take(card: $0) }
        fourcard.forEach { player5.take(card: $0) }
        
        if let winner = [player1, player2, player3, player4, player5].max() {
        XCTAssertEqual(5, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveHighCard() {
        let cards = [ace, two, three, four, queen]
        let cards2 = [two, three, four, five, seven]
        let cards3 = [ace, two, seven, eight, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        let player3 = Player(order: 3)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        cards3.forEach { player3.take(card: $0) }

        if let winner = [player1, player2, player3].max() {
            XCTAssertEqual(3, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveOnePair() {
        let cards = [jack, jack, queen]
        let cards2 = [queen, queen, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
        if let winner = [player1, player2].max() {
            XCTAssertEqual(2, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveTwoPair() {
        let cards = [jack, jack, queen, queen]
        let cards2 = [queen, queen, king, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
        if let winner = [player1, player2].max() {
            XCTAssertEqual(2, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveTriple() {
        let cards = [ten, ten, jack, jack, queen, queen]
        let cards2 = [jack, jack, queen, queen, king, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
        if let winner = [player1, player2].max() {
            XCTAssertEqual(2, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveStriaght() {
        let cards = [ace, two, three, four, five]
        let cards2 = [nine, ten, jack, queen, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
        if let winner = [player1, player2].max() {
            XCTAssertEqual(2, winner.showOrder())
        }
    }
    
    func testWinner_whenAllPlayersHaveFourCard() {
        let cards = [eight, eight, nine, nine, jack, jack, queen, queen]
        let cards2 = [ten, ten, jack, jack, queen, queen, king, king]
        
        let player1 = Player(order: 1)
        let player2 = Player(order: 2)
        
        cards.forEach { player1.take(card: $0) }
        cards2.forEach { player2.take(card: $0) }
        
        if let winner = [player1, player2].max() {
            XCTAssertEqual(2, winner.showOrder())
        }
    }
}
