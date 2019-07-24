//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let gameMode = GameInputView.readModeSelection()
    let numOfParticipant = GameInputView.readNumberOfParticipants()
    guard let mode = gameMode, let entry = numOfParticipant else {
        return
    }
    let cardGame = CardGame(dealer: PokerDealer(hand: Hand(), deck: CardDeck()), gameMode: mode, numberOfPlayers: entry.count)
    while(cardGame.continueGame()){
        cardGame.gameStart()
        OutputView.printPlayers(game: cardGame)
        OutputView.printResultPlayer(name: cardGame)
    }
}

main()
