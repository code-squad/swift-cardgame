//
//  CardDeck.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardDeck {
    private var cardDeck : [Card]
    init() { cardDeck = [] }
    
    // 카드 덱 초기화
    func reset() {
    }
    
    // 카드 덱의 현재 카드 개수를 반환
    func count() -> Int {
        return cardDeck.count
    }
    
    func shuffle() {
    }
    
    func removeOne() {
    }
}
