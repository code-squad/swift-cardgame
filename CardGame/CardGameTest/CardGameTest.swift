//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by oingbong on 2018. 9. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {
    
    func test_두개의카드중에_숫자가높은경우_True(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.two, shape: CardShape.club)
        XCTAssertTrue(card2.isHighNumber(with: card1))
    }
    
    func test_두개카드의_숫자가동일한경우_False(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.ace, shape: CardShape.diamond)
        XCTAssertFalse(card2.isHighNumber(with: card1))
    }
    
    func test_플레이어가_가진_카드중에_제일숫자가높은카드(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.two, shape: CardShape.club)
        let card3 = Card.init(number: CardNumber.three, shape: CardShape.club)
        let cards:[Card] = [card1 , card2 , card3]
        let player = Player.init(cards, "참가자#1")
        XCTAssertEqual(player.findLargestNumber(), card3)
    }
    
    // 핸즈
    func test_플레이어의_핸즈_nothing(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.two, shape: CardShape.diamond)
        let card3 = Card.init(number: CardNumber.three, shape: CardShape.heart)
        let card4 = Card.init(number: CardNumber.four, shape: CardShape.diamond)
        let card5 = Card.init(number: CardNumber.five, shape: CardShape.heart)
        let cards:[Card] = [card1 , card2 , card3 , card4 , card5]
        let player = Player.init(cards, "참가자#1")
        let (hands, highCard) = player.hands()
        XCTAssertEqual(hands, Hands.nothing)
    }
    
    func test_플레이어의_핸즈_onepair(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.ace, shape: CardShape.diamond)
        let card3 = Card.init(number: CardNumber.two, shape: CardShape.heart)
        let card4 = Card.init(number: CardNumber.three, shape: CardShape.diamond)
        let card5 = Card.init(number: CardNumber.four, shape: CardShape.heart)
        let cards:[Card] = [card1 , card2 , card3 , card4 , card5]
        let player = Player.init(cards, "참가자#1")
        let (hands, highCard) = player.hands()
        XCTAssertEqual(hands, Hands.onepair)
    }
    
    func test_플레이어의_핸즈_twopair(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.ace, shape: CardShape.diamond)
        let card3 = Card.init(number: CardNumber.two, shape: CardShape.heart)
        let card4 = Card.init(number: CardNumber.two, shape: CardShape.diamond)
        let card5 = Card.init(number: CardNumber.three, shape: CardShape.heart)
        let cards:[Card] = [card1 , card2 , card3 , card4 , card5]
        let player = Player.init(cards, "참가자#1")
        let (hands, highCard) = player.hands()
        XCTAssertEqual(hands, Hands.twopair)
    }
    
    func test_플레이어의_핸즈_triple(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.ace, shape: CardShape.diamond)
        let card3 = Card.init(number: CardNumber.ace, shape: CardShape.heart)
        let card4 = Card.init(number: CardNumber.two, shape: CardShape.diamond)
        let card5 = Card.init(number: CardNumber.three, shape: CardShape.heart)
        let cards:[Card] = [card1 , card2 , card3 , card4 , card5]
        let player = Player.init(cards, "참가자#1")
        let (hands, highCard) = player.hands()
        XCTAssertEqual(hands, Hands.triple)
    }
    
    func test_플레이어의_핸즈_fourcard(){
        let card1 = Card.init(number: CardNumber.ace, shape: CardShape.club)
        let card2 = Card.init(number: CardNumber.ace, shape: CardShape.diamond)
        let card3 = Card.init(number: CardNumber.ace, shape: CardShape.heart)
        let card4 = Card.init(number: CardNumber.ace, shape: CardShape.spade)
        let card5 = Card.init(number: CardNumber.two, shape: CardShape.heart)
        let cards:[Card] = [card1 , card2 , card3 , card4 , card5]
        let player = Player.init(cards, "참가자#1")
        let (hands, highCard) = player.hands()
        XCTAssertEqual(hands, Hands.fourcard)
    }
    
}
