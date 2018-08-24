//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func playGame() throws {
    let inputValue = InputView.readInput()
    
    // 입력값 비어있는지 확인
    guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
    
    guard let action = Int(input) else { throw CardError.inputError }

    switch action {
    case 1:
        // reset
        CardDeck.reset()
        let action = "카드 전체를 초기화했습니다."
        let count = CardDeck.count()
        let countAction = "장의 카드가 있습니다."
        OutputView.printCard(action: action, count: count, countAction: countAction)
    case 2:
        // shuffle
        CardDeck.shuffle()
        let action = ""
        let count = CardDeck.count()
        let countAction = "장의 카드를 섞었습니다."
        OutputView.printCard(action: action, count: count, countAction: countAction)
    case 3:
        // removeOne
        guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
        let action = "\(removeCard)"
        let count = CardDeck.count()
        let countAction = "장의 카드가 남아있습니다."
        OutputView.printCard(action: action, count: count, countAction: countAction)
    default:
        throw CardError.inputError
    }
}

var play = true

while play {
    do {
        try playGame()
    } catch CardError.inputError {
        print(CardError.inputError.rawValue)
        print()
    } catch CardError.inputNil {
        print(CardError.inputNil.rawValue)
        print()
    } catch CardError.noCardsRemaining {
        print(CardError.noCardsRemaining.rawValue)
        print()
    } catch {
        print(CardError.unknown.rawValue)
        print()
    }
}
