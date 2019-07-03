//
//  MyPlayerTests.swift
//  CardGameTests
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MyPlayerTests: XCTestCase {

    //Given
    var hand = CardHand()
    var player:MyPlayer!
    
    override func setUp() {
        self.player = MyPlayer(hand: hand)
    }
    
    func testReceive() {
        //Given
        let before = self.hand.count()
        
        //When
        player.receive(Card.init(suit: .clubs, rank: .ace))
        let after = self.hand.count()

        //Then
        XCTAssertEqual(before+1, after)
    }
    
    func testClearHand() {
        //Given
        let expected = 0
        
        //When
        self.player.clearHand()
        let result = self.hand.count()
        
        //Then
        XCTAssertEqual(result, expected)
    }
    
    func testComparableSameRank() {
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        let winner = MyPlayer(name: "승자", hand: higher)
        let loser = MyPlayer(name: "패자", hand: lower)
        
        //When
        higher.append(Card(suit: .clubs, rank: .ace))
        higher.append(Card(suit: .diamonds, rank: .ace))
        higher.append(Card(suit: .spades, rank: .eight))
        higher.append(Card(suit: .hearts, rank: .eight))
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        lower.append(Card(suit: .spades, rank: .king))
        lower.append(Card(suit: .hearts, rank: .king))
        
        //Then
        XCTAssertTrue(winner > loser) // twopair - A vs twopair - K
    }
    
    func testComparableDiffRank() {
        // Given
        let higher = CardHand()
        let lower = CardHand()
        
        let winner = MyPlayer(name: "승자", hand: higher)
        let loser = MyPlayer(name: "패자", hand: lower)
        
        //When
        higher.append(Card(suit: .clubs, rank: .two))
        higher.append(Card(suit: .diamonds, rank: .two))
        higher.append(Card(suit: .spades, rank: .two))
        
        
        lower.append(Card(suit: .clubs, rank: .five))
        lower.append(Card(suit: .diamonds, rank: .five))
        
        //Then
        XCTAssertTrue(winner > loser) // trips - 2 vs onePair - 5
    }
    
}
