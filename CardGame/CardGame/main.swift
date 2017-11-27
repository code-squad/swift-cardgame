//
//  main.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

var cardDeck: CardDeck = CardDeck()
var selectedNum: Int = -1
let inputView: InputView = InputView()
while ((selectedNum != 0) && (cardDeck.count() != 0)) {
    print(InputView.InputGuide.menu.rawValue)
    do {
        selectedNum = try inputView.readInput()
    } catch InputView.InputGuide.invalidInput {
        print(InputView.InputGuide.invalidInput.rawValue)
        continue
    }
    switch selectedNum {
    case 1:
        cardDeck.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count())장의 카드가 있습니다.")
    case 2:
        cardDeck.shuffle()
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
    case 3:
        let deletedCard: String = cardDeck.removeOne()
        print(deletedCard)
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
    default:
        break
    }
}
print("카드게임이 종료되었습니다.")

