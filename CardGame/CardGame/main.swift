//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let input = InputView(), output = OutputView(), cardDeck = CardDeck()
    var mode = input.readGameMode(), number = input.readPlayersNumber()
    
    while !["1", "2"].contains(mode) {
        mode = input.readGameMode()
        output.printError(ProcessError.invalidMode.rawValue)
    }
    
    while !["1", "2", "3", "4"].contains(number) {
        number = input.readPlayersNumber()
        output.printError(ProcessError.invalidPlayer.rawValue)
    }
    
    let cardGame = CardGame(cardDeck: cardDeck, mode: GameType(rawValue: mode)!, number: Int(number)!)
    
    var flag = true
    while flag {
        cardGame.play()
        output.showResults(of: cardGame)
        
        print(cardGame.countOfCards())
        if cardGame.countOfCards() < GameType(rawValue: mode)!.mode * (Int(number) ?? 0) {
            flag = false
        }
    }
    
    output.printError(ProcessError.gameOver.rawValue)
    return
}

main()
