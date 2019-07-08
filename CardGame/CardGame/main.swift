//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func mainOfHandlingDeck() {
    let deck = CardDeck()
    while let selectedNumber = InputView.menuNumber(), selectedNumber != 0 {
        guard let  selectedMenu = DeckMenu.init(rawValue: selectedNumber) else { return }
        let game = Dealer(deck: deck)
        let result = game.handlingDeck(by: selectedMenu)
        OutputView.printResult(of: result)
    }
}

func main() {
    let mode = GameInputView.readGameMode()
    let count = GameInputView.readPlayerCount()
    guard let gameMode = GameMode.init(rawValue: mode),
        let playerCount = Participant.init(rawValue: count) else { return }
    
    let gameInfo = GameInfo(mode: gameMode, players: playerCount)
    var game = CardGame(info: gameInfo)
    
    game.run()
    
    OutputView.printResult(of: game)
}

main()
