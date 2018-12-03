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
    cardDeck.reset()
    
    while true {
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
            if cardDeck.count() == 1 {
                print("카드덱에 더 이상 카드가 없습니다.")
                return
            }
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
    }
}

main()
