//
//  CardGame.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGameWays {
    
    func reset(cardDeck: CardDeck, result: @escaping (_ cardCount: Int) -> Void) {
        cardDeck.reset()
        result(cardDeck.count())
    }
    
    func shuffle(cardDeck: CardDeck, result: @escaping (_ cardCount: Int) -> Void) {
        cardDeck.shuffle()
        result(cardDeck.count())
    }
    
    func removeOne(cardDeck: CardDeck, result: @escaping (_ removeCard: Card?, _ cardCount: Int) -> Void) {
        result(cardDeck.removeOne(), cardDeck.count())
    }
    
}
