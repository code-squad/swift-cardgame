//
//  CardGame.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum State: CustomStringConvertible {
        case initializeCards(count: Int)
        case shuffleCards(count: Int)
        case drawOneCard(card: Card, count: Int)
        
        var description: String {
            switch self {
            case .initializeCards(let count):
                return "카드 전체를 초기화했습니다.\n총 \(count)장의 카드가 있습니다."
            case .shuffleCards(let count):
                return "전체 \(count)장의 카드를 섞었습니다."
            case .drawOneCard(let card, let count):
                return "\(card)\n총 \(count)장의 카드가 남아있습니다."
            }
        }
    }
    
    private(set) var currentState: State
    private(set) var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
        self.currentState = .initializeCards(count: deck.count())
    }
    
    mutating func config(number: Int) {
        switch number {
        case 1:
            deck.reset()
            currentState = .initializeCards(count: deck.count())
        case 2:
            deck.shuffle()
            currentState = .shuffleCards(count: deck.count())
        case 3:
            guard let card = deck.removeOne() else {
                return
            }
            currentState = .drawOneCard(card: card, count: deck.count())
        default:
            return
        }
    }
}
