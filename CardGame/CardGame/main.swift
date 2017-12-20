//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() throws {
    let cardDeck = CardDeck()
    var dealer = Dealer(cardDeck)

    while(true) {
        do {
            let action = try InputView.question()
            let card = try dealer.executeSelectedAction(action)
            
            OutputView.printResult(gameMenu: action, usingDeck: dealer.cardDeck, choiceCard: card)
        } catch let error as GameError {
            print(error.rawValue)
            break
        }
    }
}

//try run()

func main() throws {
    do {
        let gameMenu = try GameInputView.selectMenus()
        let playerCount = Int(try GameInputView.selectNumberOfPlayers()) ?? 0
        var game = Game(Dealer(CardDeck()))
        try game.start(gameMenu: gameMenu, playerCount: playerCount)
        
        OutputView.printResult(game.dealer)
    } catch let error as GameError {
        print(error.rawValue)
    }
}
    
try main()

