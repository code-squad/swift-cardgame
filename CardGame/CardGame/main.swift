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
    
    // inputview
    let inputView = InputView()
    let numberOfMenu = inputView.printMenu()
    
    // outputview
    let outputView = OutputView(cardDeck: cardDeck)
    outputView.printResult(numberOfMenu: numberOfMenu)
  
}
run()
