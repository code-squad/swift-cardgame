//
//  OutputView.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResult(gameMenu action: Dealer.Action, usingDeck cardDeck: CardDeck, choiceCard card: Card?) {
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
    
    static func printResult(_ dealer: Dealer) {
        for (index, value) in dealer.cardStacks.enumerated() {
            if dealer.cardStacks.count-1 == index {
                print("딜러 \(value)")
                break
            }
            
            print("참가자#\(index+1) \(value)")
        }
    }
}
