//
//  HandDeterminatorTests.swift
//  CardGameTests
//
//  Created by Daheen Lee on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class HandDeterminatorTests: XCTestCase {
    let straightCards = Cards([Card(.two, of: .club), Card(.three, of: .spade), Card(.four, of: .heart), Card(.five, of: .diamond), Card(.six, of: .club)])
    let highCards = Cards([Card(.ace, of: .club), Card(.nine, of: .spade), Card(.two, of: .heart), Card(.queen, of: .diamond), Card(.king, of: .club)])
    let onePairCards = Cards([Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.king, of: .club)])
    let twoPairCards = Cards([Card(.eight, of: .club), Card(.eight, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.three, of: .club)])
    let threeOfKindCards = Cards([Card(.five, of: .club), Card(.five, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.king, of: .club)])
    let fourOfKindCards = Cards([Card(.six, of: .club), Card(.six, of: .spade), Card(.six, of: .heart), Card(.six, of: .diamond), Card(.king, of: .club)])
    var player: Player!
    
    override func setUp() {
        player = Player()
    }
    
    override func tearDown() {
        player = nil
    }
    
    func testHighestRankPicked() {
        player.take(newCards: straightCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.highestRank, Card.Rank.six, "HandDeterminator 가 highest rank를 return 하지 않습니다.")
    }
    
    func testHighestHandPicked() {
        let mixedHandsCards = Cards([Card(.five, of: .club), Card(.five, of: .spade), Card(.five, of: .heart), Card(.three, of: .diamond), Card(.three, of: .club)])
        player.take(newCards: mixedHandsCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.threeOfKind, "HandDeterminator 가 highest hand를 return 하지 않습니다.")
    }
    
    func testStraightDecision() {
        player.take(newCards: straightCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.straight)
        XCTAssertEqual(decision.highestRank, Card.Rank.six)
    }
    
    func testTwoPairDecision() {
        player.take(newCards: twoPairCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.twoPair)
        XCTAssertEqual(decision.highestRank, Card.Rank.eight)
    }
    
    func testThreeOfKindDecision() {
        player.take(newCards: threeOfKindCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.threeOfKind)
        XCTAssertEqual(decision.highestRank, Card.Rank.five)
    }
    
    func testFourOfKineDecision() {
        player.take(newCards: fourOfKindCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.fourOfKind)
        XCTAssertEqual(decision.highestRank, Card.Rank.six)
    }
    
    func testHighCardDecision() {
        player.take(newCards: highCards)
        let decision = player.determineWinningPokerHand()
        XCTAssertEqual(decision.hand, Hands.highCard)
        XCTAssertEqual(decision.highestRank, Card.Rank.king)
    }
}
