//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let modeOfGame = GameInputView.readModeSelection()
    let numOfParticipant = GameInputView.readNumberOfParticipants()
    guard let mode = modeOfGame, let entry = numOfParticipant else {
        return
    }
    let cardGame = CardGame(dealer: PokerDealer(deck: CardDeck(), number: 0, name: "딜러"), gameMode: mode, numberOfPlayers: entry.count)
    while(cardGame.continueGame()){
        cardGame.gameStart()
        OutputView.printPlayers(game: cardGame)
       
    }
}

main()
