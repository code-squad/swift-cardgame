//
//  OutputView.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResult(gameMenu action: CardGame.Action, usingDeck cardDeck: CardDeck, choiceCard card: Card?) {
        switch action {
        case .reset:
            print("카드 전체를 초기화했습니다.")
        case .shuffle:
            print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
        case .selectOne:
            print(card!.description)
            print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
        }
    }
}
