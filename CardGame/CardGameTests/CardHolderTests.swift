//
//  CardHolderTests.swift
//  CardGameTests
//
//  Created by sungchan.you on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardHolderTests: XCTestCase {

    func testCardHolder_makeAllCards_number_should_multiply_rank_suite () {
        let cards = CardHolder.allCards()
        XCTAssertTrue(cards.count == Card.Rank.allCases.count * Card.Suite.allCases.count)
    }
}
