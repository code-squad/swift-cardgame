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
}
