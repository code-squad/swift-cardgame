//
//  PockerPlayerTests.swift
//  CardGameTests
//
//  Created by sungchan.you on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class PockerPlayerTests: XCTestCase {

    func testPockerPlayer_should_return_pockerplayer_with_updated_card() {
        let cards = [Card(rank: .ace, suite: .club)]
        let newCards = [Card(rank: .seven, suite: .club)]
        let player = PockerPlayer(name: "Tiger", cards: cards)
        let newPlayer = player.updated(by: newCards)
        XCTAssertTrue(newPlayer.cards.first == newCards.first)
    }
    
    func testPockerPlayerable_should_return_description() {
        let card = Card(rank: .ace, suite: .club)
        let player: PockerPlayable = PockerPlayer(name: "Tiger", cards: [card])
        XCTAssertTrue(player.description.contains(card.description))
    }
}
