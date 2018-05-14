//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    do {
        let gameMode: CardGameMode = try GameInputView.readGameMode(askMessage: Question.selectMode)
        let numberOfPlayers: Int = GameInputView.readNumberOfPlayers(askMessage: Question.numberOfPlayers)
        guard let cardGame = CardGame(gameMode, numberOfPlayers) else {
            throw GameInputView.Error.invalidNumberOfPlayers
        }
        cardGame.shuffleCard()
        while true {
            try cardGame.dealOutCard()
            OutputView.descriptionOfPlayers(cardGame)
        }
    } catch let error as GameInputView.Error {
        print(error.errorMessage)
    } catch let error as CardDeck.Error {
        print(error.errorMessage)
    } catch {
        fatalError("unexpected error")
    }
}

main()
