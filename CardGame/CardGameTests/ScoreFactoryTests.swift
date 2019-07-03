//
//  ScoreFactoryTests.swift
//  CardGameTests
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class ScoreFactoryTests: XCTestCase {
    
    //Given
    var cards = [Card]()
    
    let c9 = Card.init(suit: .clubs, rank: .nine)   //  ♣️9
    let c10 = Card.init(suit: .clubs, rank: .ten)   //  ♣️10
    let cJ = Card.init(suit: .clubs, rank: .jack)   //  ♣️J
    let cQ = Card.init(suit: .clubs, rank: .queen)  //  ♣️Q
    let cK = Card.init(suit: .clubs, rank: .king)   //  ♣️K
    
    let cA = Card.init(suit: .clubs, rank: .ace)    //  ♣️A
    let hA = Card.init(suit: .hearts, rank: .ace)   //  ♥️A
    let sA = Card.init(suit: .spades, rank: .ace)   //  ♠️A
    let dA = Card.init(suit: .diamonds, rank: .ace) //  ♦️A
    
    let d2 = Card.init(suit: .diamonds, rank: .two) //  ♦️2
    let s2 = Card.init(suit: .spades, rank: .two)   //  ♠️2
    
    
    func testCreateHighCard () {
        //When
        cards.append(contentsOf: [d2,dA,cK,cJ,c9])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.highCard(top: dA))
    }
    
    func testCreateOnePair () {
        //When
        cards.append(contentsOf: [d2,s2,c10,dA,c9])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.onePair(top: s2))
    }
    
    func testCreateTwoPair () {
        //When
        cards.append(contentsOf: [d2,s2,sA,dA,c9])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.twoPair(top: sA))
    }
    
    func testCreateTrips () {
        //When
        cards.append(contentsOf: [d2,cA,sA,dA,c9])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.trips(top: sA))
    }
    
    func testCreateStright () {
        //When
        cards.append(contentsOf: [cA,c10,cJ,cK,cQ])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.straight(top: cA))
    }
    
    func testCreateFourCard () {
        //When
        cards.append(contentsOf: [cA,c10,dA,hA,sA])
        let score = ScoreFactory.create(cards)!
        
        //Then
        XCTAssertEqual(score, Score.fourCard(top: sA))
    }
    
}
