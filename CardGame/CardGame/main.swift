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
    var cardGame = CardGame(cardDeck)

    while(true) {
        do {
            let action = try InputView.question()
            let card = try cardGame.startGame(action)
            
            OutputView.printResult(gameMenu: action, usingDeck: cardGame.cardDeck, choiceCard: card)
        } catch let error as CardGame.GameError {
            print(error.rawValue)
            break
        }
    }
}

//try run()


// 실행함수를 분리함
func main() throws {
    let cardDeck = CardDeck()
    var cardGame = CardGame(cardDeck)
    
    do {
        try cardGame.setCardStacks(7)
        OutputView.printResult(game: cardGame)
    } catch let error as CardGame.GameError {
        print(error.rawValue)
    }
}
    
try main()

