//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

class Dealer: Dealerable, Playerable {
    
    private var deck: Deck
    private var cards: [Card] = [Card]()
    
    // 딜러가 덱을 관리 해야 하므로 Dealer 생성시 deck을 받아서 객체 생성
    init(_ deck: Deck) {
        self.deck = deck
    }
    
    /// Dealerable
    // 카드를 나누어주는 함수
    func distributeCard() -> Card {
        return deck.removeOne()
    }
    
    // 카드를 섞는 함수
    func shuffleCard() {
        self.deck.shuffle()
    }
    
    // 게임이 끝나는지 체크하는 함수
    func isClose(_ rule: CARDGAME.RURE, _ player: CARDGAME.PLAYER) -> Bool {
        return self.deck.count() >= (rule.Type * (player.Count + 1)) ? true : false
    }
    
    /// Playerable
    // 자신의 패를 보여주는 함수
    func showMyCard() -> [Card] {
        return self.cards
    }
    
    // 자신의 카드를 버리는 함수
    func resetMyCard() {
        self.cards.removeAll()
    }
    
    // 딜러에게 카드를 받는 함수
    func receiveCard(_ card: Card) {
        self.cards.append(card)
    }
    
    func showPlayer(_ handler: (Playerable) -> Void) {
        print("\(CARDGAME.playerNames.dealer)", terminator: "")
        handler(self)
    }
}

