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
        let gameWays = CardGameWays()
        
        if menuItem == 1 {
            gameWays.reset(cardDeck: cardDeck) { cardCount in
                print("카드 전체를 초기화하였습니다.")
                print("총 \(cardCount)장의 카드가 있습니다.")
                print("")
            }
        } else if menuItem == 2 {
            gameWays.shuffle(cardDeck: cardDeck) { cardCount in
                print("전체 \(cardCount)장의 카드를 섞었습니다.")
                print("")
            }
        } else {
            gameWays.removeOne(cardDeck: cardDeck) { (card, cardCount) in
                if let card = card {
                    print("\(card.suitDescribe())\(card.rankDescribe())")
                }
                print("총 \(cardCount)장의 카드가 있습니다.")
                print("")
            }
        }
    }
}
