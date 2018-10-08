//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    static func run(){
        do {
            let originCards = CardDeckGenerator.generateCards()
            var deck = CardDeck(cards: originCards)
            let stacks = deck.generateStacks()
            stacks.forEach {
                OutputView.display(CardGameResult.stack($0))
            }
            // while문의 true로 입력을 받는 기존의 기능 프로그램에서 false를 넣어 입력문으로 진입하지 않게 막는다.
            while false { // true -> false 
                let picked = try InputView.read()
                switch picked {
                case .reset:
                    deck.reset(with: originCards)
                    OutputView.display(CardGameResult.reset(deck.count))
                case .shuffle:
                    deck.shuffle()
                    OutputView.display(CardGameResult.shuffle(deck.count))
                case .pick:
                    let picked = deck.removeOne()
                    OutputView.display(CardGameResult.pick(picked, deck.count))
                }
            }
        } catch let err as CardGameError {
            OutputView.display(err)
        } catch {
            OutputView.display(CardGameError.unknown)
        }
    }
}

Main.run()
