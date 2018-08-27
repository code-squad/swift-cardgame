//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

/*
 일시적으로 기능을 제거할 때 어떤 방법이 좋은지 고민
 : 객체단위로 코드를 구현되있기 때문에 아래와 같이 간단하게 처리하였습니다.
 1. 입력받는 것으로 시작하는 메소드 호출을 주석처리
 2. 카드생성 & 카드섞기 메소드 호출
 3. 카드출력
 */

struct CardGame {
    public static func cardStack() {
        CardDeck.reset()
        CardDeck.shuffle()
        for i in 1...7 {
            if let cards = CardDeck.remove(i) {
                OutputView.printCards(cards: cards)
            }
        }
    }
    
    public static func play() {
        while true {
            do {
                let inputValue = InputView.readInput()
                guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
                guard let action = CardAction.init(rawValue: input) else { throw CardError.inputError }
                try self.pickMenu(action)
            } catch CardError.inputError {
                OutputView.printError(error: CardError.inputError)
            } catch CardError.inputNil {
                OutputView.printError(error: CardError.inputNil)
            } catch CardError.noCardsRemaining {
                OutputView.printError(error: CardError.noCardsRemaining)
            } catch {
                OutputView.printError(error: CardError.unknown)
            }
        }
    }
    
    private static func pickMenu(_ action: CardAction) throws {
        switch action {
        case .reset:
            CardDeck.reset()
            let action = "카드 전체를 초기화했습니다."
            let count = CardDeck.count()
            let countAction = "장의 카드가 있습니다."
            OutputView.printAction(action: action, count: count, countAction: countAction)
        case .shuffle:
            CardDeck.shuffle()
            let action = ""
            let count = CardDeck.count()
            let countAction = "장의 카드를 섞었습니다."
            OutputView.printAction(action: action, count: count, countAction: countAction)
        case .removeOne:
            guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
            let action = "\(removeCard)"
            let count = CardDeck.count()
            let countAction = "장의 카드가 남아있습니다."
            OutputView.printAction(action: action, count: count, countAction: countAction)
        }
    }
}

//CardGame.play()
CardGame.cardStack()
