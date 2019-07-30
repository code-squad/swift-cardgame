//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let cardDeck = CardDeck()
    let dealer = Dealer(cardDeck: cardDeck)
    
    gameLoop: while true {
        let gameMenu = GameMenu(GameInputView.readGameMenu())
        let numberOfPlayer = NumberOfPlayer(GameInputView.readNumberOfPlayer())
        
        if gameMenu == .exit || numberOfPlayer == .invalidValue {
            break gameLoop
        }
        
        let players = PlayerGenerator.generatePlayer(numberOfPlayer: numberOfPlayer)
        
        let cardGame = CardGame(dealer: dealer, players: players, gameMenu: gameMenu)
        
        do {
            try cardGame.run()
        } catch let error as CardDeckError {
            print(error.localizedDescription)
            break gameLoop
        } catch {
            print(error)
            break gameLoop
        }
        
        OutputView.printResult(of: cardGame)
    }
}

main()
