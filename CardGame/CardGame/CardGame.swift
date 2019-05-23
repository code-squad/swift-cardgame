//
//  CardGame.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    var cardDeck = CardDeck()
    
    /// 메뉴 숫자에 따라 함수를 실행시켜준다.
    mutating func executeMenu (_ menu: Menu) throws -> (Card?, Int) {
        var returnCard: Card? = nil
        switch menu {
        case .removeOne: returnCard = try removeOne()
        case .reset: reset()
        case .shuffle: shuffle()
        }
        
        return (returnCard, count())
    }

    /// 갖고 있는 카드 개수를 반환한다.
    private func count () -> Int {
        return cardDeck.cards.count
    }
    
    /// 기능은 전체 카드를 랜덤하게 섞는다.
    private mutating func shuffle () {
        cardDeck.cards = cardDeck.cards.shuffled()
    }
    
    /// 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    private mutating func removeOne () throws -> Card {
        guard let firstCard = cardDeck.cards.first else {
            throw CardError.NotExistCard
        }
        
        cardDeck.cards.removeFirst()
        
        return firstCard
    }
    
    /// 처음처럼 모든 카드를 다시 채워넣는다.
    private mutating func reset () {
        cardDeck.cards.removeAll()
        
        cardDeck = CardDeck()
    }
}
