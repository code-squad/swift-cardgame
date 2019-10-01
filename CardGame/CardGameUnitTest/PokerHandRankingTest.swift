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
    
    var allPlayers : [PokerPlayable]!

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
        
        for index in 0...5 {
            highCardPlayer.addCard(card: Card(suit: self.suitsPool[index%4], rank: ranksPool[index*2 + 1]))
            highCardPlayerLow.addCard(card: Card(suit: self.suitsPool[index%4], rank: ranksPool[index*2]))
        }
        
        highCardPlayer.addCard(card: Card(suit: .clubs, rank: .ace))
        highCardPlayerLow.addCard(card: Card(suit: .clubs, rank: .two))
        
        allPlayers = []
        allPlayers.append(contentsOf: [
            fourCardPlayer,
            straightPlayer,
            triplePlayer,
            twoPairPlayer,
            onePairPlayer,
            highCardPlayer,
            fourCardPlayerLow,
            straightPlayerLow,
            triplePlayerLow,
            twoPairPlayerLow,
            onePairPlayerLow,
            highCardPlayerLow]
        )
        
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_PokerHand_Winner_ranking_and_score() {
        do {
            // 딜러는 의미 없음.
            let poker = Poker(dealer: highCardPlayerLow)
            for player in allPlayers {
                poker.addPlayer(player: player)
            }
            
            let rankerList = try poker.rankerList()
            
            // 순위 검증
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[0].hands().score, fourCardPlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[1].hands().score, fourCardPlayerLow.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[2].hands().score, straightPlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[3].hands().score, straightPlayerLow.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[4].hands().score, triplePlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[5].hands().score, triplePlayerLow.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[6].hands().score, twoPairPlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[7].hands().score, twoPairPlayerLow.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[8].hands().score, onePairPlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[9].hands().score, onePairPlayerLow.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[10].hands().score, highCardPlayer.hands().score))
            XCTAssertNoThrow(try XCTAssertEqual(rankerList[11].hands().score, highCardPlayerLow.hands().score))
        }
        catch {
            // try 를 해야 하는 경우 XCTAssertNoThrow 는 exception 에 대한 검증을 할 뿐.
            // try 문의 결과값을 받아야할 때 do-catch 를 안 쓰는 방법은 없나?
            XCTFail()
        }
    }
    
    func test_PokerHand_FourCard_score() {
        XCTAssertNoThrow(try XCTAssertEqual(fourCardPlayer.hands().score, PokerHandRankings.FourCard(rank: .king).score))
    }
    
    func test_PokerHand_Straight_score() {
        XCTAssertNoThrow(try XCTAssertEqual(straightPlayer.hands().score, PokerHandRankings.Straight(rank: .jack).score))
    }
    
    func test_PokerHand_Triple_score() {
        XCTAssertNoThrow(try XCTAssertEqual(triplePlayer.hands().score, PokerHandRankings.Triple(rank: .jack).score))
    }
    
    func test_PokerHand_TwoPair_score() {
        XCTAssertNoThrow(try XCTAssertEqual(twoPairPlayer.hands().score, PokerHandRankings.TwoPair(rank: .four).score))
    }
    
    func test_PokerHand_OnePair_score() {
        XCTAssertNoThrow(try XCTAssertEqual(onePairPlayer.hands().score, PokerHandRankings.OnePair(rank: .seven).score))
    }
    
    func test_PokerHand_HighCard_score() {
        XCTAssertNoThrow(try XCTAssertEqual(highCardPlayer.hands().score, PokerHandRankings.HighCard(rank: .queen).score))
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
