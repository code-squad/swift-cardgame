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
        case .removeOne:
            returnCard = try cardDeck.removeOne()
        case .reset:
            cardDeck.reset()
        case .shuffle:
            cardDeck.shuffle()
        case .exit:
            break
        }
        
        return (returnCard, cardDeck.count())
    }
}
