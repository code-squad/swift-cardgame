//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {

    static func run() {
        var cardDeck = CardDeck.init()
        while(!cardDeck.isEmpty) {
            let numSelected = InputView.readInput()
            guard let menuSelected = MenuController.getMenu(of: numSelected) else { continue }
            let result = cardDeck.makeResult(of: menuSelected)
            OutputView.show(result)
            guard menuSelected != .quit else { break }
        }
    }

    // 임시 실행 함수를 따로 구현하여 기존의 입력, 처리 및 출력 기능을 잠시 비활성화합니다.
    static func runTest() {
        let cardDeck = CardDeck()
        let cardStacks = CardStacks(from: cardDeck)
        OutputView.showDescription(of: cardStacks)
    }
    
    static func runGame() {
        do {
            let gameInfo = try GameInputView.readGameInfo()
            let cardGame = try CardGame.init(gameMode: gameInfo.mode, numberOfPlayers: gameInfo.numberOfPlayers)
            while true {
                guard try cardGame.play() else { break }
                print(cardGame.showCards())
            }
        } catch {
            print(error)
        }
    }

}

Main.runGame()
