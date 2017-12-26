
//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run(){
   
    // make card deck
    let cardDeck = CardDeck()    

// 주석을 사용하여 입력기능을 잠시 사용하지 않음.
/********** input menu **********/
    
/*
    var isPlay = true

    repeat {
        // inputview
        let inputView = InputView()
        let numberOfMenu = inputView.printMenu()
        if numberOfMenu == 4 {
            isPlay = false
        }

        // outputview
        let outputView = OutputView(cardDeck: cardDeck)
        outputView.printResult(numberOfMenu: numberOfMenu)
    } while isPlay
*/
    
/************ card stack ************/
    
    let outputView = OutputView(cardDeck: cardDeck)
    outputView.printCardStack()
}
run()
