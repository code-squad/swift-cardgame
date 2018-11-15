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
        var cardDeck = CardDeck.init()
        var cardStacks: [CardStack] = []
        for number in 1...7 {
            guard let cardStack = cardDeck.removeMultiple(by: number) else { break }
            cardStacks.append(cardStack)
        }
        let result = cardStacks
            .map { "\($0)" }
            .joined(separator: "\n")
        OutputView.show(result)
    }

}

Main.runTest()
