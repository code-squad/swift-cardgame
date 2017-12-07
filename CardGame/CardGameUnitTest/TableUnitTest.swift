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
        let clubKCard = Card(suit: 3, rank: 12)
        let clubQCard = Card(suit: 3, rank: 11)
        let clubJCard = Card(suit: 3, rank: 10)
        let club10Card = Card(suit: 3, rank: 9)
        let club9Card = Card(suit: 3, rank: 8)
        let testStack = [club9Card, club10Card, clubJCard, clubQCard, clubKCard]
        
        let table = Table(fivePoketOnePlayer)
        _ = try! table.makeGameTable(with: deck)
        XCTAssertEqual(table.cardStacksOfTable[0], testStack)
    }

}
