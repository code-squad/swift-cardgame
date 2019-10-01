//
//  HandValueTests.swift
//  CardGameTests
//
//  Created by sungchan.you on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TexasHoldemTests: XCTestCase {
    
    let criteria = TexasHoldem()
    
    lazy var playerWithFourCards: PockerPlayer = {
        return PockerPlayer(name: "Tiger",
                            cards: [Card(rank: .five, suite: .club), Card(rank: .five, suite: .spade),
                                    Card(rank: .five, suite: .diamond), Card(rank: .five, suite: .heart),
                                    Card(rank: .nine, suite: .heart)])
    }()
    
    lazy var playerWithStraight: PockerPlayer = {
        return PockerPlayer(name: "Rabbit",
                            cards: [Card(rank: .five, suite: .club), Card(rank: .six, suite: .spade),
                                    Card(rank: .seven, suite: .heart), Card(rank: .eight, suite: .heart),
                                    Card(rank: .nine, suite: .heart)])
    }()
    
    lazy var  playerWithTriple: PockerPlayer = {
        return PockerPlayer(name: "Fox",
                            cards : [Card(rank: .seven, suite: .club), Card(rank: .seven, suite: .spade),
                                     Card(rank: .seven, suite: .heart), Card(rank: .eight, suite: .heart),
                                     Card(rank: .nine, suite: .heart)])
    }()
    
    lazy var playerWithTwoPair: PockerPlayer = {
        return PockerPlayer(name: "Bear",
                            cards: [Card(rank: .five, suite: .club), Card(rank: .five, suite: .spade),
                                    Card(rank: .seven, suite: .heart), Card(rank: .seven, suite: .heart),
                                    Card(rank: .nine, suite: .heart)])
    }()
    
    lazy var playerWithPair: PockerPlayer = {
        return PockerPlayer(name: "Monkey",
                            cards: [Card(rank: .five, suite: .club), Card(rank: .five, suite: .spade),
                                    Card(rank: .seven, suite: .heart), Card(rank: .eight, suite: .heart),
                                    Card(rank: .nine, suite: .heart)])
    }()
    
    lazy var playerWithNoPair: PockerPlayer = {
        return PockerPlayer(name: "Dog",
                            cards: [Card(rank: .five, suite: .club), Card(rank: .two, suite: .spade),
                                    Card(rank: .seven, suite: .heart), Card(rank: .ace, suite: .heart),
                                    Card(rank: .nine, suite: .heart)])
    }()
    

    func testTexasHoldem_fourCard_win() {
        let winners = criteria.winner(among: [playerWithFourCards, playerWithStraight, playerWithPair, playerWithTwoPair])
        XCTAssertTrue(winners.count == 1)
        XCTAssertTrue(winners.first?.name == "Tiger")
    }
    
    func testTexasHoldem_straigt_win() {
        let winners = criteria.winner(among: [playerWithStraight, playerWithPair, playerWithTwoPair])
        XCTAssertTrue(winners.count == 1)
        XCTAssertTrue(winners.first?.name == "Rabbit")
    }
    
    func testTexasHoldem_triple_win() {
        let winners = criteria.winner(among: [playerWithTriple, playerWithPair, playerWithTwoPair])
        XCTAssertTrue(winners.count == 1)
        XCTAssertTrue(winners.first?.name == "Fox")
    }
    
    func testTexasHoldem_twoPair_win() {
        let winners = criteria.winner(among: [playerWithPair, playerWithTwoPair])
        XCTAssertTrue(winners.count == 1)
        XCTAssertTrue(winners.first?.name == "Bear")
    }
    
    func testTexasHoldem_Pair_win() {
        let winners = criteria.winner(among: [playerWithPair, playerWithNoPair])
        XCTAssertTrue(winners.count == 1)
        XCTAssertTrue(winners.first?.name == "Monkey")
    }
    
    func testTexasHoldem_no_winner() {
        let player1 = PockerPlayer(name: "NoCard", cards: [])
        let player2 = PockerPlayer(name: "NoCard", cards: [])
        
        let winners = criteria.winner(among: [player1, player2])
        XCTAssertTrue(winners.count == 0)
    }
}
