//
//  CardGame.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardDeckConvertible {
    mutating func shuffleCard()
    mutating func resetCard()
    mutating func remove(numberOfCards: Int) -> [Card]
}

class CardGame {
    private let numberOfCardStacks: Int
    private var cardDeck: CardDeckConvertible = CardDeck()
    private var allCardStack: AllCardStack
    
    init(_ numberOfCardStacks: Int) {
        self.allCardStack = AllCardStack(numberOfCardStacks: numberOfCardStacks)
        self.numberOfCardStacks = numberOfCardStacks
    }
    
    func resetGame() {
        self.cardDeck.resetCard()
        self.allCardStack = AllCardStack(numberOfCardStacks: numberOfCardStacks)
    }
    
    func shuffleCard() {
        self.cardDeck.shuffleCard()
    }
    
    func dealOutCard() {
        for cardStackIndex in 0..<self.numberOfCardStacks {
            let cards: [Card] = self.cardDeck.remove(numberOfCards: cardStackIndex + 1)
            self.allCardStack.add(cards: cards, at: cardStackIndex)
        }
    }
}

extension CardGame: CardStackPrintable {
    func descriptionOfCardStack(at index: Int) -> String {
        return self.allCardStack.descriptionOfCardStack(at: index)
    }
}
