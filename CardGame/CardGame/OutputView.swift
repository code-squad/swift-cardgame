//
//  OutputView.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 22..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class OutputView {
    func printResult(numberOfMenu: Int) {
        let cardDeck = CardDeck()
        var cardOfAll = [CardData]()
        var cardOfChange = [CardData]()
        var cardOfChoice: CardData
        switch numberOfMenu {
        case 1:
            cardOfAll = cardDeck.reset()
            print("카드 전체를 초기화했습니다.")
            print("총 \(cardDeck.count())장의 카드가 있습니다.")
        case 2:
            cardOfChange = cardDeck.shuffle(cardOfChange: cardOfChange, cardOfOrigin: cardOfAll)
            print("전체 52장의 카드를 섞었습니다.")
        case 3:
            cardOfChoice = cardDeck.removeOne()
            print(cardOfChoice)
            print("총 51장의 카드가 남아있습니다.")
        default:
            break
        }
    }
}
