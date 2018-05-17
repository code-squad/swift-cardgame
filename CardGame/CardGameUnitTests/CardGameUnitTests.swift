//
//  CardGameUnitTests.swift
//  CardGameUnitTests
//
//  Created by moon on 2018. 5. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class CardGameUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasStraight_success() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .hearts, number: .ten),
                             Card(suit: .clubs, number: .nine),
                             Card(suit: .clubs, number: .eight),
                             Card(suit: .clubs, number: .seven)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasStraight(cards))
    }
    
    func testNoHasStraight_success() {
        let cards: [Card] = [Card(suit: .clubs, number: .jack),
                             Card(suit: .hearts, number: .ten),
                             Card(suit: .clubs, number: .nine),
                             Card(suit: .clubs, number: .eight),
                             Card(suit: .clubs, number: .six),
                             Card(suit: .clubs, number: .two),
                             Card(suit: .clubs, number: .three)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasStraight(cards))
    }
}
