//
//  PokerGameTests.swift
//  CardGameTests
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import XCTest

class PokerGameTests: XCTestCase {
    func test_PokerGameData_구조체_검사() throws {
        let pokerGameData = try PokerGame.start(choiceMenu: PokerGame.Menu.sevenCards, playerCount: 6)
        XCTAssertTrue(pokerGameData.dealerInformation.handInformation.count == 7)
        XCTAssertTrue(pokerGameData.playersInformation.count == 6)
        XCTAssertTrue(pokerGameData.dealerInformation.remainCards.count == 3)
    }
    
}
