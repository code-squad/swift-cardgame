//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    let battle = CardBattle()
    var cardDeck = CardDeck()
    cardDeck.shuffle()
    var cardGame = CardGame(cardDeck: cardDeck)
    var menu = Menu()
    
    while true {
        do {
            let inputType = GameInputView.announceGameType(totalCard: cardGame.cardDeck.count())
            let gameType = try menu.selectGame(of: inputType)
            if gameType == 0 {
                break
            }
            let inputPlayer = GameInputView.inputPlayerNumber()
            let playerNumber = try menu.distinctPlayerNumber(of: inputPlayer)
            let allocatedCards = try cardGame.cardAllocation(cardCount: gameType, playerCount: playerNumber)
            let winner = battle.compareCard(players: allocatedCards)
            let winMent = battle.winMent(winner: winner)
            OutputView.printPlayersCards(of: allocatedCards)
            OutputView.printWinner(of: winMent)
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
