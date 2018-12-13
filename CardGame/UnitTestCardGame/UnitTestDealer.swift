//
//  UnitTestDealer.swift
//  UnitTestCardGame
//
//  Created by 윤동민 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestDealer: XCTestCase {
    var dealer: Dealer!
    var deck: CardDeck!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        deck = CardDeck()
        dealer = Dealer(of: deck)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dealer = nil
    }
    
    // 카드를 플레이어에게 나누어 주고 난 후 카드 수 확인
    func testDistributeCardToPlayer() {
        let players: Players = Players()
        players.makePlayer(by: .three, dealer)
        dealer.distributeCardToPlayer(to: players, by: 5)
        XCTAssertEqual(deck.count(), 32, "not Distribute Card To Player")
    }
}
