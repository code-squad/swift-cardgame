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
        let gameMenu = GameMenu(GameInputView.readGameMenu())
        let numberOfPlayer = NumberOfPlayer(GameInputView.readNumberOfPlayer())
        
        if gameMenu.rawValue == 0 || numberOfPlayer.rawValue == 0 {
            break gameLoop
        }
        
        if cardDeck.hasEnoughCard(gameMenu: gameMenu, numberOfPlayer: numberOfPlayer) {
            break gameLoop
        }
        
        let players = PlayerGenerator.generatePlayer(numberOfPlayer: numberOfPlayer)
        
        cardGame.run(gameMenu: gameMenu, players: players)
    }
}

main()
