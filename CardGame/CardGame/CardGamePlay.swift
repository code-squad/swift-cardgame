//
//  CardGamePlay.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardGamePlay {

    
    func playGame() throws {
        let cardDeck : CardDeck = CardDeck.init()
        //게임 종류
        while true {
            let selectedGameType = try handleGameTypeInput().get()
            let numberOfPlayers = try handlePlayersInput() ?? 1
            let playerList = try handleCardDistributionProcess(playerNumbers: numberOfPlayers, cardDeck: cardDeck, type: selectedGameType)
            switch playerList {
            case .success(let players):
                OutputView.showPlayersDistributedCardList(players)
                let cardGameResult = CardGameResult.init(players)
                OutputView.showWinner(cardGameResult.selectWinnerName())
                break
            case .failure(_):
                return
            }
        }
    }
    
    private func handleGameTypeInput() throws -> Result<GameType, GameMenuError> {
        var selectedGameType: GameType = GameType.sevenCard
        while true {
            GameInputView.selectGame()
            do {
                let input = try InputView.readInput()
                let numericInstruction = try Validation.convertInteger(input)
                let selectedGameType: GameType = try GameType(numericInstruction)
                break
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
        }
        return .success(selectedGameType)
    }
    
    private func handlePlayersInput() throws -> Int? {
        var numberOfPlayers: Int = 1
        while true {
            //인원
            GameInputView.selectNumberOfPlayers()
            do {
                let input = try InputView.readInput()
                numberOfPlayers = try Validation.validateGamePlayerNumbers(input)
                break
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
        }
        return numberOfPlayers
    }
    
    private func handleCardDistributionProcess(playerNumbers: Int, cardDeck: CardDeck, type: GameType) throws -> Result<[GamePlayer], DrawCardError>{
        var playerList = buildPlayersList(num: playerNumbers)
            // 처리
        do {
            playerList = try fillDeckOfPlayers(players: playerList, deck: cardDeck, type: type).get()
        } catch let errorType as DrawCardError {
            print(errorType.description)
            return .failure(errorType)
            //출력
            OutputView.showPlayersDistributedCardList(playerList)
//            let gameResult = CardGameResult.init(playerList)
//            gameResult.sortPlayerCardDeck()
        }
        return .success(playerList)
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
