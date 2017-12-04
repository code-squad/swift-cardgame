//
//  PlayerTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 12. 1..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import CardGame

class PlayerTest: XCTestCase {
    var player: Player!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        player = nil
        super.tearDown()
    }

    func testInit() {
        player = Player.init(name: "tester")
        XCTAssertEqual(player.description, "tester : []")
    }

    func testCallNewCard() {
        player = Player.init(name: "tester")
        player.callNewCard(Card.init(suit: .spades, rank: .ace))
        XCTAssertEqual(player.description, "tester : [♠️A]")
        player.callNewCard(Card.init(suit: .hearts, rank: .ace))
        XCTAssertEqual(player.description, "tester : [♥️A, ♠️A]")
    }

}
