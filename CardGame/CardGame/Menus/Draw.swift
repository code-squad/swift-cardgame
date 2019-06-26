//
//  Draw.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Draw: Menu {
    
    func process(cards: CardDeck) -> (CardDeck, Notice) {
        var cards = cards
        var notice = cards.removeOne()?.description ?? "덱이 비었습니다."
        notice += "총 \(cards.count())장의 카드가 남아있습니다."
        return (cards,notice)
    }
}
