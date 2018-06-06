//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

class Dealer: Dealerable, Playerable {
    
    public private(set) var deck: Deck
    private var cards: [Card] = [Card]()
    
    // 딜러가 덱을 관리 해야 하므로 Dealer 생성시 deck을 받아서 객체 생성
    init() {
        self.deck = Deck()
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

