//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct CardGame {
    public static func play() {
        while true {
            do {
                let inputValue = InputView.readInput()
                guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
                
                try self.pickMenu(input)
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
    }
    
    private static func pickMenu(_ input: String) throws {

        guard let action = Action.init(rawValue: input) else { throw CardError.inputError }
        
        switch action {
        case .reset:
            CardDeck.reset()
            let action = "카드 전체를 초기화했습니다."
            let count = CardDeck.count()
            let countAction = "장의 카드가 있습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        case .shuffle:
            CardDeck.shuffle()
            let action = ""
            let count = CardDeck.count()
            let countAction = "장의 카드를 섞었습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        case .removeOne:
            guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
            let action = "\(removeCard)"
            let count = CardDeck.count()
            let countAction = "장의 카드가 남아있습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        }
    }
}

CardGame.play()
