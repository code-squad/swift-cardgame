//
//  Shuffle.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Shuffle: Menu {
    
    func process(cards: CardDeck) -> (CardDeck, Notice) {
        var cards = cards
        cards.shuffle()
        let notice = "전체 \(cards.count())장의 카드를 섞었습니다."
        return (cards,notice)
    }
}
