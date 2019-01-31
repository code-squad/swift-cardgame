//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck = CardDeck.init()
    while(!cardDeck.isEmpty) {
        let numSelect = InputView.getCardGameStart()
        guard let menuNumber = MenuBox.getMenu(numSelect) else {
            OutputView().errorResult(.notMenu)
            continue
        }
        let result = CardFactory.makeCardStatus(menuNumber,cardDeck)
        if result.1.count() > 0 {
            cardDeck = result.1
        }
        OutputView.output(result.0)
        guard menuNumber != .quit else { break }
    }
}
//step3 Main
func step3Main() {
    do {
        let game = try GameInputView.readCardGameInfo()
        let cardGame = CardGame.init(gameMode: game.mode, players: game.numberPlayer)
        
        while cardGame.play() {
            OutputView.showResults(cardGame.gameMakePlays)
        }
    } catch let error as GameInputError {
        OutputView().errorResult(error)
    } catch { }
}

//main()
step3Main()
