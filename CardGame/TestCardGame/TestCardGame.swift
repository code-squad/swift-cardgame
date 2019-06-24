//
//  TestCardGame.swift
//  TestCardGame
//
//  Created by jang gukjin on 24/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TestCardGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFourPair() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .one),
                Card(suit: .clover, rank: .one),
                Card(suit: .heart, rank: .one),
                Card(suit: .spade, rank: .one),
                Card(suit: .diamond, rank: .two),
                Card(suit: .diamond, rank: .three),
                Card(suit: .diamond, rank: .four),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .five),
                Card(suit: .clover, rank: .five),
                Card(suit: .heart, rank: .five),
                Card(suit: .spade, rank: .five),
                Card(suit: .diamond, rank: .six),
                Card(suit: .diamond, rank: .seven),
                Card(suit: .diamond, rank: .eight),
            ]),
            Dealer(cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .seven),
                Card(suit: .heart, rank: .ten),
                Card(suit: .spade, rank: .two),
                Card(suit: .diamond, rank: .seven),
                Card(suit: .diamond, rank: .nine),
                Card(suit: .diamond, rank: .ten),
                ])]
        
        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        let result = CardBattle().compareCard(players: deck)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber < playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber > playerB.maxNumber)
        XCTAssertTrue(result.getName() == "참가자#2")
    }

    func testStraight() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .one),
                Card(suit: .clover, rank: .two),
                Card(suit: .heart, rank: .three),
                Card(suit: .spade, rank: .four),
                Card(suit: .diamond, rank: .five),
                Card(suit: .clover, rank: .six),
                Card(suit: .diamond, rank: .four),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .seven),
                Card(suit: .heart, rank: .eight),
                Card(suit: .spade, rank: .nine),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .two),
                Card(suit: .diamond, rank: .three),
            ])]

        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber < playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber > playerB.maxNumber)
    }
    
    func testTriple() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .three),
                Card(suit: .clover, rank: .two),
                Card(suit: .heart, rank: .three),
                Card(suit: .spade, rank: .two),
                Card(suit: .diamond, rank: .five),
                Card(suit: .diamond, rank: .two),
                Card(suit: .diamond, rank: .four),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .seven),
                Card(suit: .heart, rank: .one),
                Card(suit: .spade, rank: .one),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .eleven),
                Card(suit: .diamond, rank: .one),
            ])]
        
        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber > playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber < playerB.maxNumber)
    }
    
    func testTwoPair() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .three),
                Card(suit: .clover, rank: .two),
                Card(suit: .heart, rank: .three),
                Card(suit: .spade, rank: .two),
                Card(suit: .diamond, rank: .five),
                Card(suit: .diamond, rank: .one),
                Card(suit: .diamond, rank: .four),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .six),
                Card(suit: .heart, rank: .one),
                Card(suit: .spade, rank: .one),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .eleven),
            ])]

        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber > playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber < playerB.maxNumber)
    }
    
    func testOnePair() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .three),
                Card(suit: .clover, rank: .one),
                Card(suit: .heart, rank: .three),
                Card(suit: .spade, rank: .two),
                Card(suit: .diamond, rank: .five),
                Card(suit: .diamond, rank: .six),
                Card(suit: .diamond, rank: .ten),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .four),
                Card(suit: .heart, rank: .one),
                Card(suit: .spade, rank: .three),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .eleven),
            ])]

        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber < playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber > playerB.maxNumber)
    }
    
    func testNoScore() {
        let deck: [Player] = [ Participant(name: "참가자#1", cards: [
                Card(suit: .diamond, rank: .three),
                Card(suit: .clover, rank: .one),
                Card(suit: .heart, rank: .twelve),
                Card(suit: .spade, rank: .two),
                Card(suit: .diamond, rank: .five),
                Card(suit: .diamond, rank: .six),
                Card(suit: .diamond, rank: .ten),
            ]),
            Participant(name: "참가자#2", cards: [
                Card(suit: .diamond, rank: .six),
                Card(suit: .clover, rank: .four),
                Card(suit: .heart, rank: .one),
                Card(suit: .spade, rank: .three),
                Card(suit: .diamond, rank: .two),
                Card(suit: .diamond, rank: .ten),
                Card(suit: .diamond, rank: .eleven),
            ])]
        
        let playerA = CardResult().judgeByRule(of: deck[0].cards)
        let playerB = CardResult().judgeByRule(of: deck[1].cards)
        
        XCTAssertTrue(playerA.result == playerB.result)
        XCTAssertTrue(playerA.maxNumber > playerB.maxNumber)
        XCTAssertFalse(playerA.maxNumber < playerB.maxNumber)
    }
}
