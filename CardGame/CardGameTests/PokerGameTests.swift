//
//  PokerGameTests.swift
//  CardGameTests
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import XCTest

class PokerGameTests: XCTestCase {
    func test_PokerGameData_구조체_데이터_확인() throws {
        let pokerGameData = try PokerGame.start(choiceMenu: PokerGame.Menu.sevenCards, playerCount: 6)
        XCTAssertTrue(pokerGameData.dealerInformation.handInformation.count == 7)
        XCTAssertTrue(pokerGameData.playersInformation.count == 6)
        XCTAssertTrue(pokerGameData.dealerInformation.remainCards.count == 3)
    }
    
    func test_PokerGameData_승자_확인() throws {
        // 스트레이트 플러쉬
        let card1 = Card(suit: Suit.club, number: Number.six)
        let card2 = Card(suit: Suit.club, number: Number.seven)
        let card3 = Card(suit: Suit.club, number: Number.eight)
        let card4 = Card(suit: Suit.club, number: Number.nine)
        let card5 = Card(suit: Suit.club, number: Number.ten)
        let card6 = Card(suit: Suit.diamond, number: Number.two)
        let card7 = Card(suit: Suit.heart, number: Number.three)
        let cards = [card1, card2, card3, card4, card5, card6, card7]
        let hand = Hand(cards: cards)
        
        // 플러쉬
        let card21 = Card(suit: Suit.club, number: Number.six)
        let card22 = Card(suit: Suit.club, number: Number.jack)
        let card23 = Card(suit: Suit.heart, number: Number.seven)
        let card24 = Card(suit: Suit.spade, number: Number.seven)
        let card25 = Card(suit: Suit.club, number: Number.seven)
        let card26 = Card(suit: Suit.club, number: Number.two)
        let card27 = Card(suit: Suit.club, number: Number.three)
        let cards2 = [card21, card22, card23, card24, card25, card26, card27]
        let hand2 = Hand(cards: cards2)
        
        // 투페어
        let card31 = Card(suit: Suit.spade, number: Number.six)
        let card32 = Card(suit: Suit.club, number: Number.seven)
        let card33 = Card(suit: Suit.heart, number: Number.eight)
        let card34 = Card(suit: Suit.spade, number: Number.jack)
        let card35 = Card(suit: Suit.club, number: Number.jack)
        let card36 = Card(suit: Suit.diamond, number: Number.two)
        let card37 = Card(suit: Suit.spade, number: Number.seven)
        let cards3 = [card31, card32, card33, card34, card35, card36, card37]
        let hand3 = Hand(cards: cards3)
        
        // 딜러 -> 하이카드
        let card41 = Card(suit: Suit.spade, number: Number.six)
        let card42 = Card(suit: Suit.club, number: Number.seven)
        let card43 = Card(suit: Suit.heart, number: Number.eight)
        let card44 = Card(suit: Suit.spade, number: Number.jack)
        let card45 = Card(suit: Suit.club, number: Number.ace)
        let card46 = Card(suit: Suit.diamond, number: Number.two)
        let card47 = Card(suit: Suit.spade, number: Number.ten)
        let cards4 = [card41, card42, card43, card44, card45, card46, card47]
        let hand4 = Hand(cards: cards4)
        
        let dealer = Dealer(hand: hand4, deck: Deck())
        let player1 = Player(hand: hand2, name: "참가자1")
        let player2 = Player(hand: hand, name: "참가자2")
        let player3 = Player(hand: hand3, name: "참가자3")
        let players = [player1, player2, player3]
        let pokerGameData = PokerGameData(dealer: dealer, players: players)
        
        let (winnerPlayer, winnerHandType) = pokerGameData.confirmWinner()
        XCTAssertTrue(winnerPlayer.nameInformation == "참가자2")
        XCTAssertTrue(winnerHandType == HandType.straightFlush)
    }
    
}
