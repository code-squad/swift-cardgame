//
//  CardGame.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum Error: Swift.Error {
        case invalidInput
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .invalidInput:
                return "유효하지 않은 입력입니다."
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
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
    
    private(set) var state: State
    private(set) var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
        self.state = .initializeCards(count: deck.count())
    }
    
    mutating func config(number: Int) throws {
        switch number {
        case 1:
            deck.reset()
            state = .initializeCards(count: deck.count())
        case 2:
            deck.shuffle()
            state = .shuffleCards(count: deck.count())
        case 3:
            guard let card = deck.removeOne() else {
                throw Error.isCardDeckEmpty
            }
            state = .drawOneCard(card: card, count: deck.count())
        default:
            throw Error.invalidInput
        }
    }
}

extension CardGame: OutputViewPrintable {
    func printGameResult(handler: (String) -> ()) {
        handler(state.description)
    }
}
