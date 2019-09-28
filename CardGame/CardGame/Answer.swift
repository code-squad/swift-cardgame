//
//  Answer.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Answer {
    static func action(inquiry: Inquiry, cardDeck: CardDeck) -> CardDeck {
        var tempDeck = cardDeck
        switch inquiry {
        case .reset:
            tempDeck.reset()
            print("카드 전체를 초기화했습니다.")
            print("총 \(tempDeck.count())장의 카드가 있습니다.")
        case .shuffle:
            tempDeck.randomShuffle()
            print("전체 \(tempDeck.count())장의 카드를 섞었습니다.")
        case .pickOne:
            print(tempDeck.removeOne())
            print("총 \(tempDeck.count())장의 카드가 남아있습니다.")
        }
        return tempDeck
    }
}
