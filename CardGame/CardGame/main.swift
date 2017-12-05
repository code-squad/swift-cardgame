//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func executeCard() {
    let inputView = InputView()
    let outputView = OutputView()
    var deck = Deck()
    
    print(try? deck.makeStack(numberOfCards: 52))
    // Menu 를 출력하는 while 문을 false로 지정해서 실행하지 않게 하였습니다. 그리고
    // 스택의 값을 출력하는 부분을 false위에 선언하여 해결하였습니다.
    var repeatCondition = false
    
    while repeatCondition {
        guard let kindOfFunction = inputView.read() else {
            outputView.errorMsg(.invaildInput)
            return
        }
        switch kindOfFunction {
        case "1":
            deck = deck.reset()
            outputView.resetMsg()
            outputView.countOfDeck(deck)
        case "2":
            deck.shuffle()
            outputView.countOfRestDeck(deck)
        case "3":
            outputView.showMeTheCard(deck.removeOne())
            outputView.countOfDeck(deck)
        case "q", "Q":
            repeatCondition = false
        default:
            outputView.errorMsg(.invaildInput)
        }
    }
    
}
executeCard()
