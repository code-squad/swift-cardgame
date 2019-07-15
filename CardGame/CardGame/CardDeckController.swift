//
//  CardDeckController.swift
//  CardGame
//
//  Created by JH on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeckController {
    let inputView = InputView()
    let output = OutputView()
    var deck = CardDeck()
    
    mutating func resetDeck() {
        deck.reset()
        output.show("카드 전체를 초기화했습니다.")
        showDeckCount()
    }
    
    mutating func shuffleDeck() {
        deck.shuffle()
        output.show("전체 \(deck.count())장의 카드를 섞었습니다.")
    }
    
    func showDeckCount() {
        output.show("총 \(deck.count())장의 카드가 있습니다.")
    }
    
    mutating func removeOne() {
        if let card = deck.removeOne() {
            output.show("\(card)")
            showDeckCount()
            return
        }
        output.show("제거할 카드가 없습니다")
    }
}
