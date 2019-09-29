//
//  OutputView.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {

    static func printResult(cardDeck: CardDeck, menuItem: Int) {
        if menuItem == 1 {
            cardReset(cardDeck: cardDeck) { cardCount in
                print("카드 전체를 초기화하였습니다.")
                print("총 \(cardCount)장의 카드가 있습니다.")
                print("")
            }
        } else if menuItem == 2 {
            cardShuffle(cardDeck: cardDeck) { cardCount in
                print("전체 \(cardCount)장의 카드를 섞었습니다.")
                print("")
            }
        } else {
            cardRemoveOne(cardDeck: cardDeck) { (card, cardCount) in
                if let card = card {
                    print("\(card.suitDescribe())\(card.rankDescribe())")
                }
                print("총 \(cardCount)장의 카드가 있습니다.")
                print("")
            }
        }
    }
    
    static private func cardReset(cardDeck: CardDeck, result: @escaping (_ cardCount: Int) -> Void) {
        cardDeck.reset()
        result(cardDeck.count())
    }
    
    static private func cardShuffle(cardDeck: CardDeck, result: @escaping (_ cardCount: Int) -> Void) {
        cardDeck.shuffle()
        result(cardDeck.count())
    }
    
    static private func cardRemoveOne(cardDeck: CardDeck, result: @escaping (_ removeCard: Card?, _ cardCount: Int) -> Void) {
        result(cardDeck.removeOne(), cardDeck.count())
    }
}
