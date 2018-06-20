//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 덱 생성
    var deck = Deck()
    // 인풋뷰 생성
    let inputView = InputView()
    // 반복문용 플래그
    var flag = true
    repeat {
        // 유저입력을 받는다
        inputView.printMenuMessage()
        let userInput = inputView.getUserInput()
        switch userInput {
        case "1" :
            deck.reset()
            inputView.printResetMessage()
        case "2" :
            deck.shuffle()
            inputView.printShuffleMessage(cardCount: deck.count())
        case "3" :
            let removedCard = deck.removeOne()
            print(removedCard.getInfo())
            inputView.printRmoveOneMessage(cardCount: deck.count())
        default : flag = false
        }
        
    } while flag
}

main()

