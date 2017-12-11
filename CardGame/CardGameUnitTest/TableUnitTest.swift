//
//  TableUnitTest.swift
//  CardGameUnitTest
//
//  Created by Mrlee on 2017. 12. 7..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest

class TableUnitTest: XCTestCase {
    let fivePoketOnePlayer = CardGameInfo(typeOf: CardGameInfo.Games.fivePoker, withPlayers: 1)
    func testTableMethod() {
        let deck = Deck()
        let table = Table(gameInfo: fivePoketOnePlayer, with: deck)
        _ = try! table.dealTheCardOfGameTable()
        XCTAssertEqual(table.cardStacksOfTable[0].count, 5)
    }
}
