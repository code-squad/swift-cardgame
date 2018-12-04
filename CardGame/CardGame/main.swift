//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var menu = InputView.readStart()
    var cardDeck = CardDeck()
    let output = OutputView()
    var turn = 0
    cardDeck.reset()
    
    while turn < 52 {
        switch menu {
        case "1":
            cardDeck.reset()
            output.printReset(by: cardDeck)
            menu = InputView.readStart()
        case "2":
            cardDeck.shuffle()
            output.printShuffle(by: cardDeck)
            menu = InputView.readStart()
        case "3":
            let firstCard = cardDeck.removeOne()
            output.printRemoveOne(by: cardDeck, firstCard)
            menu = InputView.readStart()
        case "q":
            print("카드 게임을 종료합니다.")
            return
        default:
            print("올바른 메뉴를 선택하세요.")
            menu = InputView.readStart()
        }
        turn += 1
        if turn == 52 {
            print("카드덱이 비었으므로 초기화합니다.")
            cardDeck.reset()
            turn = 0
        }
    }
}

main()
