//
//  PokerHandRankingTest.swift
//  CardGameUnitTest
//
//  Created by temphee.Reid on 02/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class PokerHandRankingTest: XCTestCase {
    var suitsPool: [Card.Suit]!
    var ranksPool: [Card.Rank]!
    
    let fourCardPlayer = PokerParticipantFactory.make(name: "fourCard Player")
    let straightPlayer = PokerParticipantFactory.make(name: "straight Plyaer")
    let triplePlayer = PokerParticipantFactory.make(name: "triple Player")
    let twoPairPlayer = PokerParticipantFactory.make(name: "two pair player")
    let onePairPlayer = PokerParticipantFactory.make(name: "one pair player")
    let highCardPlayer = PokerParticipantFactory.make(name: "high player high")
    
    let fourCardPlayerLow = PokerParticipantFactory.make(name: "fourCard Player Low")
    let straightPlayerLow = PokerParticipantFactory.make(name: "straight Plyaer Low")
    let triplePlayerLow = PokerParticipantFactory.make(name: "triple Player Low")
    let twoPairPlayerLow = PokerParticipantFactory.make(name: "two pair player Low")
    let onePairPlayerLow = PokerParticipantFactory.make(name: "one pair player Low")
    let highCardPlayerLow = PokerParticipantFactory.make(name: "high player Low")
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.suitsPool =  [.spades, .hearts, .diamonds, .clubs]
        self.ranksPool = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        
        // four card player
        for index in 0...3 {
            fourCardPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: .king))
            fourCardPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: .queen))
        }
        fourCardPlayer.addCard(card: Card(suit: .spades, rank: .ace))
        fourCardPlayerLow.addCard(card: Card(suit: .spades, rank: .ace))
        fourCardPlayer.addCard(card: Card(suit: .hearts, rank: .ace))
        fourCardPlayerLow.addCard(card: Card(suit: .hearts, rank: .ace))
        fourCardPlayer.addCard(card: Card(suit: .diamonds, rank: .ace))
        fourCardPlayerLow.addCard(card: Card(suit: .diamonds, rank: .ace))
        
        
        // straight player
        for index in 0...5 {
            straightPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: ranksPool[(index+5)%10]))
            straightPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: ranksPool[index%5]))
        }
        straightPlayer.addCard(card: Card(suit: .spades, rank: .jack))
        straightPlayerLow.addCard(card: Card(suit: .spades, rank: .jack))
        straightPlayer.addCard(card: Card(suit: .hearts, rank: .king))
        straightPlayerLow.addCard(card: Card(suit: .hearts, rank: .king))
        
        
        // tirple player
        for index in 0...2 {
            triplePlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: .jack))
            triplePlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: .five))
        }
        triplePlayer.addCard(card: Card(suit: .spades, rank: .ace))
        triplePlayerLow.addCard(card: Card(suit: .spades, rank: .ace))
        triplePlayer.addCard(card: Card(suit: .hearts, rank: .ace))
        triplePlayerLow.addCard(card: Card(suit: .hearts, rank: .ace))
        triplePlayer.addCard(card: Card(suit: .diamonds, rank: .six))
        triplePlayerLow.addCard(card: Card(suit: .diamonds, rank: .six))
        triplePlayer.addCard(card: Card(suit: .clubs, rank: .seven))
        triplePlayerLow.addCard(card: Card(suit: .clubs, rank: .seven))
        
        // two pair player
        for index in 0...1 {
            twoPairPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: .four))
            twoPairPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: .ace))
            
            twoPairPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: .three))
            twoPairPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: .two))
        }
        
        twoPairPlayer.addCard(card: Card(suit: .clubs, rank: .jack))
        twoPairPlayerLow.addCard(card: Card(suit: .clubs, rank: .jack))
        
        twoPairPlayer.addCard(card: Card(suit: .hearts, rank: .six))
        twoPairPlayerLow.addCard(card: Card(suit: .hearts, rank: .six))
        
        twoPairPlayer.addCard(card: Card(suit: .diamonds, rank: .eight))
        twoPairPlayerLow.addCard(card: Card(suit: .diamonds, rank: .eight))
        
        
        
        // one pair player
        for index in 0...1 {
            onePairPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: .seven))
            onePairPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: .six))
        }
        onePairPlayer.addCard(card: Card(suit: .clubs, rank: .jack))
        onePairPlayerLow.addCard(card: Card(suit: .clubs, rank: .jack))
        
        onePairPlayer.addCard(card: Card(suit: .diamonds, rank: .ace))
        onePairPlayerLow.addCard(card: Card(suit: .diamonds, rank: .ace))
        
        onePairPlayer.addCard(card: Card(suit: .hearts, rank: .three))
        onePairPlayerLow.addCard(card: Card(suit: .hearts, rank: .three))
        
        onePairPlayer.addCard(card: Card(suit: .spades, rank: .four))
        onePairPlayerLow.addCard(card: Card(suit: .spades, rank: .four))
        
        onePairPlayer.addCard(card: Card(suit: .clubs, rank: .five))
        onePairPlayerLow.addCard(card: Card(suit: .clubs, rank: .five))
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PokerHand_FourCard() {
        do {
            let ranking = try fourCardPlayer.hands()
            XCTAssertEqual(ranking.score, PokerHandRankings.FourCard(rank: .king).score)
        }
        catch {
            // try 를 해야 하는 경우 XCTAssertNoThrow 는 exception 에 대한 검증을 할 뿐.
            // try 문의 결과값을 받아야할 때 do-catch 를 안 쓰는 방법은 없나?
            XCTFail()
        }
    }
    
    func test_PokerHand_FourCard_Win() {        
        do {
            let ranking = try fourCardPlayer.hands()
            XCTAssertEqual(ranking.score, PokerHandRankings.FourCard(rank: .king).score)
        }
        catch {
            // try 를 해야 하는 경우 XCTAssertNoThrow 는 exception 에 대한 검증을 할 뿐.
            // try 문의 결과값을 받아야할 때 do-catch 를 안 쓰는 방법은 없나?
            XCTFail()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
