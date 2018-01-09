//
//  main.swift
//  CardGame
//
//  Created by Jack
//  2018/01/05
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var runCardGame : Bool = true
let outputView : OutputView = OutputView()
var userDeck : CardDeck = CardDeck()

while runCardGame {
    
    userDeck.shuffle()
    outputView.printStacks(userDeck.generateStacks())
    runCardGame = false
    
// 잠시 기능을 일시적으로 제거 하기 위해서 일부 기능만(제 코드에서는 inputview + switch구문) 주석을 처리하는 것이 가장 좋다고 생각합니다.
// (고민이 부족한 건가요?ㅠㅠ)
    
//    outputView.printMessage(.inputMessage)
//    let userMenu = InputView().readMenu()
//    switch userMenu {
//    case "1" :
//        userDeck.reset()
//        outputView.printMessage(.resetMessage)
//    case "2" :
//        userDeck.shuffle()
//        outputView.printShuffleMessage(userDeck)
//    case "3" :
//        print(userDeck.removeOne())
//        outputView.printRemaingCards(userDeck)
//    case "4" :
//        outputView.printMessage(.exitCardGame)
//        runCardGame = false
//    default :
//        outputView.printMessage(.invalidMenu)
//    }

}
