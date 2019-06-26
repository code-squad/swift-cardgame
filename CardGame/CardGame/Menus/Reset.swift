//
//  Reset.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Reset: Menu {
    
    func process(cards: CardDeck) -> (CardDeck, Notice) {
        var cards = cards
        cards.reset()
        let notice = "카드 전체를 초기화했습니다."
        return (cards,notice)
    }
}
