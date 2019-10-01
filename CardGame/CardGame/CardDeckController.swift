//
//  CardDeckController.swift
//  CardGame
//
//  Created by 공명진 on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDeckController {
    
    static func play() {
        var menuItem = InputView.inputMenu()
        let cardDeck = CardDeck()
        
        while (menuItem != 4) {
            menuItem = InputView.inputMenu()
            
            let gameWays = CardGameWays()
            if menuItem == 1 {
                gameWays.reset(cardDeck: cardDeck) { cardCount in
                    OutputView.show("카드 전체를 초기화하였습니다.")
                    OutputView.show("총 \(cardCount)장의 카드가 있습니다.")
                    OutputView.show("")
                }
            } else if menuItem == 2 {
                gameWays.shuffle(cardDeck: cardDeck) { cardCount in
                    OutputView.show("전체 \(cardCount)장의 카드를 섞었습니다.")
                    OutputView.show("")
                }
            } else {
                gameWays.removeOne(cardDeck: cardDeck) { (card, cardCount) in
                    if let card = card {
                        OutputView.show("\(card.suitDescribe())\(card.rankDescribe())")
                    }
                    OutputView.show("총 \(cardCount)장의 카드가 있습니다.")
                    OutputView.show("")
                }
            }
        }
    }
}
