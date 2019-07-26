//
//  CardGameController.swift
//  CardGame
//
//  Created by JH on 25/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGameController {
    let inputView = InputView()
    let outputView = OutputView()
    var cardGame = CardGame()
    
    mutating func setGameRule() {
        outputView.show("카드 게임 종류를 선택하세요.")
        let cardTypes = ["7카드","5카드"]
        let ShowCardType = inputView.askForChoice(options: cardTypes)
        var selectedCardType = cardGame.gameType
        
        switch ShowCardType {
        case "7카드":
            selectedCardType = CardGame.GameType.sevenCard
        default:
            selectedCardType = CardGame.GameType.fiveCard
        }
        cardGame.setGameType(selectedCardType)
    }
    
    mutating func setPlayer() {
        outputView.show("참여할 사람의 인원을 입력하세요.")
        let playerCount = inputView.askForNumber("참여인원")
        cardGame.setPlayer(playerCount)
    }
    
    mutating func playGame() {
        cardGame.startGame()
        for index in cardGame.players.indices {
            outputView.showCard(player: cardGame.players[index])
        }
    }

}
