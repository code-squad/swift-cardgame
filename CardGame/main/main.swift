//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    var cardDeck = CardDeck()
    cardDeck.shuffle()
    
    while true {
        let input = GameInputView.announceMent()
        do {
            var cardGame = CardGame(deck: cardDeck)
            let gameData = try cardGame.gameAndPlayer(of: input)
            let allocatedCards = cardGame.cardAllocation(cardCount: gameData.type, playerCount: gameData.player)
            OutputView.printPlayersCards(of: allocatedCards)
            
        } catch let error as ErrorMessage {
            OutputView.errorPrint(of: error)
        } catch {
            OutputView.otherErrorPrint(of: error)
        }
    }
}

main()
