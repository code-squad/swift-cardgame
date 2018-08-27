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
            } catch let error {
                if let cardError = error as? CardError {
                    OutputView.printError(error: cardError)
                }
            }
        }
    }
    
    private static func pickMenu(_ cardAction: CardAction) throws {
        var condition = ""
        var count = 0
        var action = ""
        
        switch cardAction {
        case .reset:
            CardDeck.reset()
            condition = "카드 전체를 초기화했습니다."
            count = CardDeck.count()
            action = "장의 카드가 있습니다."
        case .shuffle:
            CardDeck.shuffle()
            condition = ""
            count = CardDeck.count()
            action = "장의 카드를 섞었습니다."
        case .removeOne:
            guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
            condition = "\(removeCard)"
            count = CardDeck.count()
            action = "장의 카드가 남아있습니다."
        }
        
        let message = Message.init(condition: condition, count: count, action: action)
        OutputView.printAction(message: message)
    }
}

struct Message {
    var condition: String
    var count: Int
    var action: String
}

CardGame.play()
//CardGame.cardStack()
