//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run(){
    var isPlay = true
    
    // make card deck
    let cardDeck = CardDeck()    
    
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
}
run()
