//
//  Controller.swift
//  CardGame
//
//  Created by 김성현 on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Controller {
    
    private var outputView = OutputView()
    private var inputView = InputView()
    private var inputControl = InputControl()
    
    func startGame(game: CardGame) {
        
        // 카드를 뽑고 패를 출력합니다. 카드가 다 떨어지면 게임을 종료합니다.
        var hasEnoughCards = true
        while hasEnoughCards {
            do {
                try game.giveCardsToPlayers()
                outputView.showAllHands(game: game)
                outputView.show(Message.winnerIs + game.winner.name)
                outputView.nextLine()
                
            } catch CardGameError.outOfCards {
                outputView.showError(CardGameError.outOfCards)
                hasEnoughCards = false
            } catch {
                outputView.showError(error)
                return
            }
        }
    }
    
    func generateGame() -> CardGame {
        while true {
            let rule = readGameRule()
            let playerCount = readPlayerCount()
            do {
                return try CardGame(rule: rule, playerCount: playerCount)
            } catch let error as CardGameError {
                outputView.showError(error)
            } catch {
                outputView.showError(error)
            }
        }
    }
    
    func readGameRule() -> CardGame.Rule {
        while true {
            inputView.show(Message.gameRuleQuestion)
            inputView.showOptions(CardGame.Rule.allCases)
            let choiceInput = inputView.ask(Message.selectOption)
            switch inputControl.choice(from: choiceInput, options: CardGame.Rule.allCases) {
            case .failure(let error):
                outputView.showError(error)
                continue
            case .success(let choice):
                return choice
            }
        }
    }
    
    func readPlayerCount() -> Int {
        while true {
            inputView.show(Message.playerCountQuestion)
            let playerCountInput = inputView.ask(Message.playerCount)
            switch inputControl.number(from: playerCountInput) {
            case .failure(let error):
                outputView.showError(error)
                continue
            case .success(let number):
                return number
            }
        }
    }
    
}
