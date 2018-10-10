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
            OutputView.display(.stack(stacks))
            // while문의 true로 입력을 받는 기존의 기능 프로그램에서 false를 넣어 입력문으로 진입하지 않게 막는다.
            while false { // true -> false 
                let picked = try InputView.read()
                switch picked {
                case .reset:
                    deck.reset(with: originCards)
                    OutputView.display(.reset(deck.count))
                case .shuffle:
                    deck.shuffle()
                    OutputView.display(.shuffle(deck.count))
                case .pick:
                    let picked = deck.removeOne()
                    OutputView.display(.pick(picked, deck.count))
                }
            }
        } catch let err as CardGameError {
            OutputView.display(err)
        } catch {
            OutputView.display(.unknown)
        }
    }
}

Main.run()
