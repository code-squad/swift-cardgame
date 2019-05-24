//
//  CardGame.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private var cardDeck = CardDeck()
    
    /// 메뉴 숫자에 따라 함수를 실행시켜준다.
    mutating func executeMenu (_ menu: Menu) throws -> (Card?, Int) {
        var returnCard: Card? = nil
        switch menu {
        case .removeOne: returnCard = try removeOne()
        case .reset: reset()
        case .shuffle:
            cardDeck.shuffle()
        case .exit:
            break
        }
        
        return (returnCard, cardDeck.count())
    }
    
    
    
    /// 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
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
