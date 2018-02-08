//
//  Dealer.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Dealer {
    private var deck: CardDeck
    static let shared: Dealer = Dealer()
    init() {
        self.deck = CardDeck()
    }
    
    func dealCards(_ kindOfGame: KindOfGame) -> [Card] {
        var cards: [Card] = []
        for _ in 0 ..< kindOfGame.rawValue {
            cards.append(self.deck.pickCard())
        }
        return cards
    }
    
    func noticeRemainCard() -> String {
        return "✅ 총 \(deck.count)장의 카드가 남아있습니다."
    }

    func makeName(_ index: Int) -> String {
        return "참가자\(index)#딜러 "
    }
    
    func haveEnoughCards(_ neededCards: Int) -> Bool {
        return self.deck.count >= neededCards
    }
    
}
