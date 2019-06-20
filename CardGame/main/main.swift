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
    var cardGame = CardGame(deck: cardDeck)
    var menu = Menu(deck: cardDeck)
    
    while true {
        do {
            let inputType = GameInputView.announceGameType()
            let gameType = try menu.selectGame(of: inputType)
            if menu.deck.totalCard.count == 0 {
                break
            }
            let inputPlayer = GameInputView.inputPlayerNumber()
            let playerNumber = try menu.distinctPlayerNumber(of: inputPlayer)

            let allocatedCards = try cardGame.cardAllocation(cardCount: gameType, playerCount: playerNumber)
            print(cardGame.deck.totalCard.count)
            OutputView.printPlayersCards(of: allocatedCards)
        } catch let error as ErrorMessage {
            OutputView.errorPrint(of: error.rawValue)
        } catch let error as DrawError{
            OutputView.errorPrint(of: error.rawValue)
            break
        } catch {
            OutputView.otherErrorPrint(of: error)
        }
    }
}

main()
