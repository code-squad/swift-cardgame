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
    var cardGame = CardGame(dealer: dealer)
    
    gameLoop: while true {
        dealer.reset()
        
        let gameMenu = GameMenu(GameInputView.readGameMenu())
        let numberOfPlayer = NumberOfPlayer(GameInputView.readNumberOfPlayer())
        
        if gameMenu == .exit || numberOfPlayer == .invalidValue {
            break gameLoop
        }
        
        if !dealer.hasEnoughCard(gameMenu: gameMenu, numberOfPlayer: numberOfPlayer) {
            break gameLoop
        }
        
        let players = PlayerGenerator.generatePlayer(numberOfPlayer: numberOfPlayer)
        
        cardGame.run(gameMenu: gameMenu, players: players)
        
        OutputView.printResult(of: cardGame)
    }
}

main()
