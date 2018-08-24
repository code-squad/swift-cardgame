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
    
    // 카드
    
    switch input {
    case "1":
        // reset
        CardDeck.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(CardDeck.count())장의 카드가 있습니다.")
        print()
    case "2":
        // shuffle
        CardDeck.shuffle()
        print("전체 \(CardDeck.count())장의 카드를 섞었습니다.")
        print()
    case "3":
        // removeOne
        guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
        print(removeCard)
        print("총 \(CardDeck.count())장의 카드가 남아있습니다.")
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
    } catch CardError.inputNil {
        print(CardError.inputNil.rawValue)
    } catch CardError.noCardsRemaining {
        print(CardError.noCardsRemaining.rawValue)
    } catch {
        print(CardError.unknown.rawValue)
    }
}
