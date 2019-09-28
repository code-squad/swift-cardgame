//
//  GameController.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameController {
    
    var deck: CardDeck
    
    init() {
        let cards = Card.getAllCards()
        self.deck = CardDeck(cards)
    }
    
    func ask() -> Inquiry? {
        return InputView.askQuestions()
    }
    
    mutating func answer(cardDeck: CardDeck, inquiry: Inquiry) {
        let remains = OutputView.getResult(inquiry: inquiry, deck: cardDeck)
        self.deck = remains
    }
    
    mutating func start(times: Int) {
        for _ in 1...times {
            guard let inquiry = ask() else { return }
            answer(cardDeck: deck, inquiry: inquiry)
        }
    }
}
