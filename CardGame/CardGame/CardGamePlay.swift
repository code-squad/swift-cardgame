//
//  CardGamePlay.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardGamePlay {
    func playGame() throws -> Void{
        var cardDeck : CardDeck = CardDeck.init()
        var input: String
        var selectedGameType: GameType
        var numberOfPlayers: Int
        while true {
            //게임 종류
            GameInputView.selectGame()
            do {
                input = try InputView.readInput()
                selectedGameType = try Validation.validateGameType(input)
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
            //인원
            GameInputView.selectNumberOfPlayers()
            do {
                input = try InputView.readInput()
                numberOfPlayers = try Validation.validateGamePlayerNumbers(input)
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
            //처리
            var playerList = buildPlayersList(num: numberOfPlayers)
        }
    }
    
    private func buildPlayersList(num numbers: Int) -> [GamePlayer] {
        var playerList = [GamePlayer]()
        for index in 1..<(numbers+1) {
            let player = GamePlayer("참가자#\(index)")
            playerList.append(player)
        }
        let player = GamePlayer("딜러")
        playerList.append(player)
        return playerList
    }
    
    private func fillDeckOfPlayers(players: [GamePlayer]) -> [GamePlayer]{
        return players
    }
}
