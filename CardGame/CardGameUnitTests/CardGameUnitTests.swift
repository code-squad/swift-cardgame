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
    
    /// 7카드 로열스트레이트플러시, 갖고 있는 경우
    func test_hasRoyalStraightFlush_clubSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .clubs, number: .jack),
                             Card(suit: .clubs, number: .ten),
                             Card(suit: .clubs, number: .nine),
                             Card(suit: .clubs, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_spadesSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .spades, number: .ace),
                             Card(suit: .spades, number: .king),
                             Card(suit: .spades, number: .queen),
                             Card(suit: .spades, number: .jack),
                             Card(suit: .spades, number: .ten),
                             Card(suit: .spades, number: .nine),
                             Card(suit: .spades, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_heartsSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .hearts, number: .ace),
                             Card(suit: .hearts, number: .king),
                             Card(suit: .hearts, number: .queen),
                             Card(suit: .hearts, number: .jack),
                             Card(suit: .hearts, number: .ten),
                             Card(suit: .hearts, number: .nine),
                             Card(suit: .hearts, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_diamondsSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .diamonds , number: .ace),
                             Card(suit: .diamonds, number: .king),
                             Card(suit: .diamonds, number: .queen),
                             Card(suit: .diamonds, number: .jack),
                             Card(suit: .diamonds, number: .ten),
                             Card(suit: .diamonds, number: .nine),
                             Card(suit: .diamonds, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    /// 7카드 로열스트레이트플러시, 갖고 있지 않은 경우
    func test_noHasRoyalStraightFlush_clubSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .clubs, number: .seven),
                             Card(suit: .clubs, number: .ten),
                             Card(suit: .clubs, number: .nine),
                             Card(suit: .clubs, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_spadesSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .spades, number: .ace),
                             Card(suit: .spades, number: .king),
                             Card(suit: .spades, number: .queen),
                             Card(suit: .spades, number: .seven),
                             Card(suit: .spades, number: .ten),
                             Card(suit: .spades, number: .nine),
                             Card(suit: .spades, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_heartsSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .hearts, number: .ace),
                             Card(suit: .hearts, number: .king),
                             Card(suit: .hearts, number: .queen),
                             Card(suit: .hearts, number: .seven),
                             Card(suit: .hearts, number: .ten),
                             Card(suit: .hearts, number: .nine),
                             Card(suit: .hearts, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_diamondsSuit_sevenCards() {
        let cards: [Card] = [Card(suit: .diamonds, number: .ace),
                             Card(suit: .diamonds, number: .king),
                             Card(suit: .diamonds, number: .queen),
                             Card(suit: .diamonds, number: .seven),
                             Card(suit: .diamonds, number: .ten),
                             Card(suit: .diamonds, number: .nine),
                             Card(suit: .diamonds, number: .eight)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    /// 5카드 로열스트레이트플러시
    func test_hasRoyalStraightFlush_clubSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .clubs, number: .jack),
                             Card(suit: .clubs, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_spadesSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .spades, number: .ace),
                             Card(suit: .spades, number: .king),
                             Card(suit: .spades, number: .queen),
                             Card(suit: .spades, number: .jack),
                             Card(suit: .spades, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_heartsSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .hearts, number: .ace),
                             Card(suit: .hearts, number: .king),
                             Card(suit: .hearts, number: .queen),
                             Card(suit: .hearts, number: .jack),
                             Card(suit: .hearts, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_hasRoyalStraightFlush_diamondsSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .diamonds, number: .ace),
                             Card(suit: .diamonds, number: .king),
                             Card(suit: .diamonds, number: .queen),
                             Card(suit: .diamonds, number: .jack),
                             Card(suit: .diamonds, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    /// 5카드 로열스트레이트플러시, 갖고 있지 않은 경우
    func test_noHasRoyalStraightFlush_clubSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .clubs, number: .seven),
                             Card(suit: .clubs, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_spadesSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .spades, number: .ace),
                             Card(suit: .spades, number: .king),
                             Card(suit: .spades, number: .queen),
                             Card(suit: .spades, number: .seven),
                             Card(suit: .spades, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_heartsSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .hearts, number: .ace),
                             Card(suit: .hearts, number: .king),
                             Card(suit: .hearts, number: .queen),
                             Card(suit: .hearts, number: .seven),
                             Card(suit: .hearts, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_diamondsSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .diamonds, number: .ace),
                             Card(suit: .diamonds, number: .king),
                             Card(suit: .diamonds, number: .queen),
                             Card(suit: .diamonds, number: .seven),
                             Card(suit: .diamonds, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    func test_noHasRoyalStraightFlush_differentSuit_fiveCards() {
        let cards: [Card] = [Card(suit: .diamonds, number: .ace),
                             Card(suit: .hearts, number: .king),
                             Card(suit: .diamonds, number: .queen),
                             Card(suit: .diamonds, number: .jack),
                             Card(suit: .diamonds, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasRoyalStraightFlush(cards))
    }
    
    /// 백스트레이트 O
    func test_hasBackRoyalStraightFlush() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .two),
                             Card(suit: .clubs, number: .three),
                             Card(suit: .clubs, number: .four),
                             Card(suit: .clubs, number: .five)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasBackStraightFlush(cards))
    }
    
    /// 백스트레이트 X
    func test_noBackStraightFlush() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .king),
                             Card(suit: .clubs, number: .queen),
                             Card(suit: .clubs, number: .seven),
                             Card(suit: .diamonds, number: .ten)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasBackStraightFlush(cards))
    }
    
    func test_noBackStraightFlush_differentSuit() {
        let cards: [Card] = [Card(suit: .clubs, number: .ace),
                             Card(suit: .clubs, number: .two),
                             Card(suit: .clubs, number: .three),
                             Card(suit: .clubs, number: .four),
                             Card(suit: .diamonds, number: .five)]
        let pokerHands = PokerHands()
        XCTAssertFalse(pokerHands.hasBackStraightFlush(cards))
    }
    
    
    /// 스트레이트 test
    func test_hasStraight() {
        let cards: [Card] = [Card(suit: .spades, number: .ace),
                             Card(suit: .spades, number: .king),
                             Card(suit: .spades, number: .queen),
                             Card(suit: .spades, number: .jack),
                             Card(suit: .spades, number: .ten),
                             Card(suit: .spades, number: .three),
                             Card(suit: .spades, number: .two)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasStraight(cards))
    }
    
    func test_hasStraight_2() {
        let cards: [Card] = [Card(suit: .spades, number: .six),
                             Card(suit: .spades, number: .five),
                             Card(suit: .spades, number: .four),
                             Card(suit: .spades, number: .three),
                             Card(suit: .spades, number: .two),
                             Card(suit: .spades, number: .ten),
                             Card(suit: .spades, number: .jack)]
        let pokerHands = PokerHands()
        XCTAssertTrue(pokerHands.hasStraight(cards))
    }
}
