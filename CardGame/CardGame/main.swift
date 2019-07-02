//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let deck = CardDeck()
    while let selectedNumber = InputView.menuNumber(), selectedNumber != 0 {
        guard let  selectedMenu = DeckMenu.init(rawValue: selectedNumber) else {
            return
        }
        let game = Dealer(deck: deck)
        let result = game.handlingDeck(by: selectedMenu)
        OutputView.printResult(of: result)
    }
}

func mainOfStep3() {
    let mode = GameInputView.readGameMode()
    guard let gameMode = GameMenu.init(rawValue: mode) else { return }
    guard let gameInfo = GameInfo(mode: gameMode, players: GameInputView.readPlayerCount()) else { return }
    
    let dealer = Dealer(deck: CardDeck())
    var game = CardGame(info: gameInfo, dealer: dealer)
    game.run()
}

mainOfStep3()
