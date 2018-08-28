//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    public static func run() throws {
        
        CardDeck.reset()
        CardDeck.shuffle()
        
        while true {
            // GameType
            let inputGameType = InputView.readGameType()
            guard let gameType = InputView.isEmpty(to: inputGameType) else { throw CardError.inputNil }
            guard let pickGameType = GameType.init(rawValue: gameType) else { throw CardError.inputRangeExceeded }

            // NumberOfPlayers
            let inputPlayer = InputView.readPlayer()
            guard let number = InputView.isEmpty(to: inputPlayer) else { throw CardError.inputNil }
            guard let numberOfplayers = NumberOfPlayers.init(rawValue: number) else { throw CardError.inputRangeExceeded }
            
            do {
                // Game
                let game = Game.init(gameType: pickGameType, player: numberOfplayers)
                try game.shareCard()
            } catch let cardError as CardError {
                throw cardError
            } catch {
                throw CardError.unknown
            }
        }
    }
}

do {
    try Main.run()
} catch let cardError as CardError {
    OutputView.printError(error: cardError)
} catch {
    OutputView.printError(error: CardError.unknown)
}
