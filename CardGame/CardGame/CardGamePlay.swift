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
        let cardDeck : CardDeck = CardDeck.init()
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
            // 처리
            var playerList = buildPlayersList(num: numberOfPlayers)
            do {
                playerList = try fillDeckOfPlayers(players: playerList, deck: cardDeck, type: selectedGameType).get()
            } catch let errorType as DrawCardError {
                print(errorType.description)
                break
            }
            //출력
            OutputView.showPlayersDistributedCardList(playerList)
        }
    }
    
    private func isValidGame(deck : CardDeck, numberOfPlayers: Int, distributionSize: Int) -> Bool {
        if deck.deckSize < numberOfPlayers * distributionSize {
            return false
        }
        return true
    }
    
    private func buildPlayersList(num numbers: Int) -> [GamePlayer] {
        var playerList = [GamePlayer]()
        for index in 1..<(numbers+1) {
            let player = GamePlayer("\(PlayerType.participant.description)\(index)")
            playerList.append(player)
        }
        let player = GamePlayer("\(PlayerType.dealer.description)")
        playerList.append(player)
        return playerList
    }
    
    private func fillDeckOfPlayers(players: [GamePlayer], deck : CardDeck, type: GameType) -> Result<[GamePlayer], DrawCardError>{
        if !isValidGame(deck: deck, numberOfPlayers: players.count, distributionSize: type.rawValue) {
             return .failure(DrawCardError.notEnoughCardInDeck)
        }
        deck.shuffle()
        for _ in 0..<type.rawValue {
            distributeCardsByGameRule(players: players, deck: deck)
        }
        return .success(players)
    }
    
    private func distributeCardsByGameRule(players: [GamePlayer], deck: CardDeck) {
        for player in players {
            let drewCard = try! deck.removeOne().get()
            player.addMyCard(drewCard)
        }
    }
}
