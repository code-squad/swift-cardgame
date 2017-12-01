//
//  CardGameTests.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import CardGame

class CardGameTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDescriptionForSpades() {
        let spadesAce: Card = Card.init(suit: .spades, rank: .ace, upside: false)
        let spadesTwo: Card = Card.init(suit: .spades, rank: .two, upside: false)
        let spadesThree: Card = Card.init(suit: .spades, rank: .three, upside: false)
        let spadesFour: Card = Card.init(suit: .spades, rank: .four, upside: false)
        let spadesFive: Card = Card.init(suit: .spades, rank: .five, upside: false)
        let spadesSix: Card = Card.init(suit: .spades, rank: .six, upside: false)
        let spadesSeven: Card = Card.init(suit: .spades, rank: .seven, upside: false)
        let spadesEight: Card = Card.init(suit: .spades, rank: .eight, upside: false)
        let spadesNine: Card = Card.init(suit: .spades, rank: .nine, upside: false)
        let spadesTen: Card = Card.init(suit: .spades, rank: .ten, upside: false)
        let spadesJack: Card = Card.init(suit: .spades, rank: .jack, upside: false)
        let spadesQueen: Card = Card.init(suit: .spades, rank: .queen, upside: false)
        let spadesKing: Card = Card.init(suit: .spades, rank: .king, upside: false)
        XCTAssertEqual(spadesAce.description, "♠️A")
        XCTAssertEqual(spadesTwo.description, "♠️2")
        XCTAssertEqual(spadesThree.description, "♠️3")
        XCTAssertEqual(spadesFour.description, "♠️4")
        XCTAssertEqual(spadesFive.description, "♠️5")
        XCTAssertEqual(spadesSix.description, "♠️6")
        XCTAssertEqual(spadesSeven.description, "♠️7")
        XCTAssertEqual(spadesEight.description, "♠️8")
        XCTAssertEqual(spadesNine.description, "♠️9")
        XCTAssertEqual(spadesTen.description, "♠️10")
        XCTAssertEqual(spadesJack.description, "♠️J")
        XCTAssertEqual(spadesQueen.description, "♠️Q")
        XCTAssertEqual(spadesKing.description, "♠️K")
    }

    func testDescriptionForHearts() {
        let heartsAce: Card = Card.init(suit: .hearts, rank: .ace, upside: false)
        let heartsTwo: Card = Card.init(suit: .hearts, rank: .two, upside: false)
        let heartsThree: Card = Card.init(suit: .hearts, rank: .three, upside: false)
        let heartsFour: Card = Card.init(suit: .hearts, rank: .four, upside: false)
        let heartsFive: Card = Card.init(suit: .hearts, rank: .five, upside: false)
        let heartsSix: Card = Card.init(suit: .hearts, rank: .six, upside: false)
        let heartsSeven: Card = Card.init(suit: .hearts, rank: .seven, upside: false)
        let heartsEight: Card = Card.init(suit: .hearts, rank: .eight, upside: false)
        let heartsNine: Card = Card.init(suit: .hearts, rank: .nine, upside: false)
        let heartsTen: Card = Card.init(suit: .hearts, rank: .ten, upside: false)
        let heartsJack: Card = Card.init(suit: .hearts, rank: .jack, upside: false)
        let heartsQueen: Card = Card.init(suit: .hearts, rank: .queen, upside: false)
        let heartsKing: Card = Card.init(suit: .hearts, rank: .king, upside: false)
        XCTAssertEqual(heartsAce.description, "♥️A")
        XCTAssertEqual(heartsTwo.description, "♥️2")
        XCTAssertEqual(heartsThree.description, "♥️3")
        XCTAssertEqual(heartsFour.description, "♥️4")
        XCTAssertEqual(heartsFive.description, "♥️5")
        XCTAssertEqual(heartsSix.description, "♥️6")
        XCTAssertEqual(heartsSeven.description, "♥️7")
        XCTAssertEqual(heartsEight.description, "♥️8")
        XCTAssertEqual(heartsNine.description, "♥️9")
        XCTAssertEqual(heartsTen.description, "♥️10")
        XCTAssertEqual(heartsJack.description, "♥️J")
        XCTAssertEqual(heartsQueen.description, "♥️Q")
        XCTAssertEqual(heartsKing.description, "♥️K")
    }

    func testDescriptionForDiamonds() {
        let diamondsAce: Card = Card.init(suit: .diamonds, rank: .ace, upside: false)
        let diamondsTwo: Card = Card.init(suit: .diamonds, rank: .two, upside: false)
        let diamondsThree: Card = Card.init(suit: .diamonds, rank: .three, upside: false)
        let diamondsFour: Card = Card.init(suit: .diamonds, rank: .four, upside: false)
        let diamondsFive: Card = Card.init(suit: .diamonds, rank: .five, upside: false)
        let diamondsSix: Card = Card.init(suit: .diamonds, rank: .six, upside: false)
        let diamondsSeven: Card = Card.init(suit: .diamonds, rank: .seven, upside: false)
        let diamondsEight: Card = Card.init(suit: .diamonds, rank: .eight, upside: false)
        let diamondsNine: Card = Card.init(suit: .diamonds, rank: .nine, upside: false)
        let diamondsTen: Card = Card.init(suit: .diamonds, rank: .ten, upside: false)
        let diamondsJack: Card = Card.init(suit: .diamonds, rank: .jack, upside: false)
        let diamondsQueen: Card = Card.init(suit: .diamonds, rank: .queen, upside: false)
        let diamondsKing: Card = Card.init(suit: .diamonds, rank: .king, upside: false)
        XCTAssertEqual(diamondsAce.description, "♦️A")
        XCTAssertEqual(diamondsTwo.description, "♦️2")
        XCTAssertEqual(diamondsThree.description, "♦️3")
        XCTAssertEqual(diamondsFour.description, "♦️4")
        XCTAssertEqual(diamondsFive.description, "♦️5")
        XCTAssertEqual(diamondsSix.description, "♦️6")
        XCTAssertEqual(diamondsSeven.description, "♦️7")
        XCTAssertEqual(diamondsEight.description, "♦️8")
        XCTAssertEqual(diamondsNine.description, "♦️9")
        XCTAssertEqual(diamondsTen.description, "♦️10")
        XCTAssertEqual(diamondsJack.description, "♦️J")
        XCTAssertEqual(diamondsQueen.description, "♦️Q")
        XCTAssertEqual(diamondsKing.description, "♦️K")
    }

    func testDescriptionForClubs() {
        let clubsAce: Card = Card.init(suit: .clubs, rank: .ace, upside: false)
        let clubsTwo: Card = Card.init(suit: .clubs, rank: .two, upside: false)
        let clubsThree: Card = Card.init(suit: .clubs, rank: .three, upside: false)
        let clubsFour: Card = Card.init(suit: .clubs, rank: .four, upside: false)
        let clubsFive: Card = Card.init(suit: .clubs, rank: .five, upside: false)
        let clubsSix: Card = Card.init(suit: .clubs, rank: .six, upside: false)
        let clubsSeven: Card = Card.init(suit: .clubs, rank: .seven, upside: false)
        let clubsEight: Card = Card.init(suit: .clubs, rank: .eight, upside: false)
        let clubsNine: Card = Card.init(suit: .clubs, rank: .nine, upside: false)
        let clubsTen: Card = Card.init(suit: .clubs, rank: .ten, upside: false)
        let clubsJack: Card = Card.init(suit: .clubs, rank: .jack, upside: false)
        let clubsQueen: Card = Card.init(suit: .clubs, rank: .queen, upside: false)
        let clubsKing: Card = Card.init(suit: .clubs, rank: .king, upside: false)
        XCTAssertEqual(clubsAce.description, "♣️A")
        XCTAssertEqual(clubsTwo.description, "♣️2")
        XCTAssertEqual(clubsThree.description, "♣️3")
        XCTAssertEqual(clubsFour.description, "♣️4")
        XCTAssertEqual(clubsFive.description, "♣️5")
        XCTAssertEqual(clubsSix.description, "♣️6")
        XCTAssertEqual(clubsSeven.description, "♣️7")
        XCTAssertEqual(clubsEight.description, "♣️8")
        XCTAssertEqual(clubsNine.description, "♣️9")
        XCTAssertEqual(clubsTen.description, "♣️10")
        XCTAssertEqual(clubsJack.description, "♣️J")
        XCTAssertEqual(clubsQueen.description, "♣️Q")
        XCTAssertEqual(clubsKing.description, "♣️K")
    }

}
