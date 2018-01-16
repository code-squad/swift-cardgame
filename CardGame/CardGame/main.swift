//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func runProgram () {
    var cardDeck = CardDeck()
    var isRunning = true
    while isRunning {
        print(InputView.InputMessage.welcoming)
        guard let input = InputView.input() else { continue }
        switch input {
        case 1:
            cardDeck.resetCard()
            print("카드 전체를 초기화했습니다.")
            print("총 \(cardDeck.count)장의 카드가 있습니다.")
        case 2:
            cardDeck.suffle()
            print("전체 \(cardDeck.count)장의 카드를 섞었습니다.")
        case 3:
            let deletedCard: Card = cardDeck.pickCard()
            print(deletedCard.description)
            print("총 \(cardDeck.count)장의 카드가 남아있습니다.")
        default : isRunning = false
        }
    }
}

runProgram()

