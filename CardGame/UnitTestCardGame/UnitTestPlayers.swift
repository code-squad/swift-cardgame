//
//  UnitTestPlayers.swift
//  UnitTestCardGame
//
//  Created by 윤동민 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestPlayers: XCTestCase {
    var players: Players!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        players = Players()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // playersCount() 초기 플레이어 0명인지 확인
    func testCountPlayers() {
        XCTAssertEqual(players.countPlayers(), 0, "CountPlayers() don't excute exactly")
    }
    
    // makePlayer() 플레이어 숫자만큼 생성되었는지 확인
    func testMakePlayer() {
        let dealer: Dealer = Dealer(of: CardDeck())
        players.makePlayer(by: .three, dealer)
        XCTAssertEqual(players.countPlayers(), 4, "MakePlayers() method don't excute exactly")
    }
}
