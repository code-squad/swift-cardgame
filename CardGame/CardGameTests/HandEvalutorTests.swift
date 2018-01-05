//
//  HandEvalutorTests.swift
//  CardGameTests
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class HandEvalutorTests: XCTestCase {
    func test_스트레이트_플러쉬_확인() {
        let card1 = Card(suit: Suit.club, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.club, number: Number.eight)
        let card4 = Card(suit: Suit.club, number: Number.nine)
        let card5 = Card(suit: Suit.club, number: Number.ten)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.heart, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.straightFlush)
    }
    
    func test_포카드_확인() {
        let card1 = Card(suit: Suit.club, number: Number.six)
        let card2 = Card(suit: Suit.diamond, number: Number.six)
        let card3 = Card(suit: Suit.heart, number: Number.six)
        let card4 = Card(suit: Suit.spade, number: Number.six)
        let card5 = Card(suit: Suit.club, number: Number.king)
        let card6 = Card(suit: Suit.club, number: Number.two)
        let card7 = Card(suit: Suit.club, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        //let compareedNumbers = cards.map { $0.number }.sorted { $0.rawValue > $1.rawValue }
        XCTAssertTrue(result == HandType.fourOfKind)
    }
    
    func test_풀하우스_확인() {
        let card1 = Card(suit: Suit.club, number: Number.six)
        let card2 = Card(suit: Suit.diamond, number: Number.six)
        let card3 = Card(suit: Suit.heart, number: Number.seven)
        let card4 = Card(suit: Suit.spade, number: Number.seven)
        let card5 = Card(suit: Suit.club, number: Number.seven)
        let card6 = Card(suit: Suit.club, number: Number.two)
        let card7 = Card(suit: Suit.club, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.fullHouse)
    }
    
    func test_플러쉬_확인() {
        let card1 = Card(suit: Suit.club, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.jack)
        let card3 = Card(suit: Suit.heart, number: Number.seven)
        let card4 = Card(suit: Suit.spade, number: Number.seven)
        let card5 = Card(suit: Suit.club, number: Number.seven)
        let card6 = Card(suit: Suit.club, number: Number.two)
        let card7 = Card(suit: Suit.club, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.flush)
    }
    
    func test_스트레이트_확인() {
        let card1 = Card(suit: Suit.spade, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.heart, number: Number.eight)
        let card4 = Card(suit: Suit.spade, number: Number.nine)
        let card5 = Card(suit: Suit.club, number: Number.ten)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.club, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.straight)
    }

    func test_트리플_확인() {
        let card1 = Card(suit: Suit.spade, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.heart, number: Number.eight)
        let card4 = Card(suit: Suit.spade, number: Number.seven)
        let card5 = Card(suit: Suit.club, number: Number.ten)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.spade, number: Number.seven)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.threeOfKind)
    }
    
    func test_투페어_확인() {
        let card1 = Card(suit: Suit.spade, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.heart, number: Number.eight)
        let card4 = Card(suit: Suit.spade, number: Number.jack)
        let card5 = Card(suit: Suit.club, number: Number.jack)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.spade, number: Number.seven)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.twoPair)
    }
    
    func test_원페어_확인() {
        let card1 = Card(suit: Suit.spade, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.heart, number: Number.eight)
        let card4 = Card(suit: Suit.spade, number: Number.jack)
        let card5 = Card(suit: Suit.club, number: Number.jack)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.spade, number: Number.ten)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.pair)
    }
    
    func test_하이카드_확인() {
        let card1 = Card(suit: Suit.spade, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.heart, number: Number.eight)
        let card4 = Card(suit: Suit.spade, number: Number.jack)
        let card5 = Card(suit: Suit.club, number: Number.ace)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.spade, number: Number.ten)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        let result = HandEvaluator(hand: hand).evaluateHand()
        XCTAssertTrue(result == HandType.highCard)
    }
    
}
