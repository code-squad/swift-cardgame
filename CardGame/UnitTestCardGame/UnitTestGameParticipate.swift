//
//  UnitTestGameParticipate.swift
//  UnitTestCardGame
//
//  Created by 윤동민 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestGameParticipate: XCTestCase {
    var player: GameParticipate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        player = GameParticipate("참가자#1")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        player = nil
    }
    
    // 플레이어에게 준 카드가 일치하는지 확인
    func testReceiveCard() {
        let cardStack: [Card] = [Card(.diamond, .five), Card(.clover, .four)]
        player.receiveCard(cardStack)
        XCTAssertTrue(isEqual(receiveCard: player.cards, giveCard: cardStack))
    }
    
    private func isEqual(receiveCard: [Card], giveCard: [Card]) -> Bool {
        for index in 0..<receiveCard.count {
            guard receiveCard[index] === giveCard[index] else { return false }
        }
        return true
    }
    
    // Four 카드가 맞는지 확인
    func testJudgeFourCard() {
        let cardStack: [Card] = [Card(.diamond, .five), Card(.clover, .five), Card(.spade, .five), Card(.heart, .five)]
        player.receiveCard(cardStack)
        player.judgeMyCard()
        XCTAssertEqual(player.state, .fourCard, "Don't judge Card State exactly")
    }
    
    // Tripple 카드가 맞는지 확인
    func testJudgeTripple() {
        let cardStack: [Card] = [Card(.diamond, .five), Card(.clover, .five), Card(.spade, .five)]
        player.receiveCard(cardStack)
        player.judgeMyCard()
        XCTAssertEqual(player.state, .tripple, "Don't judge Card State exactly")
    }
    
    // TwoPair 카드가 맞는지 확인
    func testJudgeTwoPair() {
        let cardStack: [Card] = [Card(.diamond, .three), Card(.spade, .four), Card(.heart, .three), Card(.clover, .four), Card(.heart, .six)]
        player.receiveCard(cardStack)
        player.judgeMyCard()
        XCTAssertEqual(player.state, .twoPair, "Don't judge Card State exactly")
    }
    
    // OnePair 카드가 맞는지 확인
    func testJudgeOnePair() {
        let cardStack: [Card] = [Card(.diamond, .three), Card(.spade, .four), Card(.heart, .three)]
        player.receiveCard(cardStack)
        player.judgeMyCard()
        XCTAssertEqual(player.state, .onePair, "Don't judge Card State exactly")
    }
}
