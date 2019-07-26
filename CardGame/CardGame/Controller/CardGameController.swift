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
        
        while true {
            let playerCount = inputView.askForNumber("참여인원")
            do {
                try cardGame.setPlayer(playerCount)
                return
            } catch GameError.incorrectPlayerCount {
                outputView.show("참여자입력 범위가 잘못됐습니다.")
                continue
            } catch {
                outputView.show("예상치못한 오류: \(error)")
                continue
            }
        }
        
    }
    
    mutating func playGame() {
        
        while true {
            do {
                try cardGame.startGame()
                
            } catch GameError.notEnoughCard {
                outputView.show("게임을 진행할 카드가없습니다")
                return
            } catch {
                outputView.show("예상치못한 오류: \(error)")
                return
            }
            for index in cardGame.players.indices {
                outputView.showCard(player: cardGame.players[index])
            }
            outputView.showCard(player: cardGame.dealer)
            cardGame.resetCards()
        }
    }
}
