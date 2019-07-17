//
//  CardDeckController.swift
//  CardGame
//
//  Created by JH on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDeckController {
    let input = InputView()
    let output = OutputView()
    var deck = CardDeck()
    
    func play() {
        let options: [String: () -> Void] = ["카드 초기화": resetDeck, "카드 섞기": shuffleDeck, "카드 하나 뽑기": removeOne]
        let optionStrings = [String](options.keys)
        let selected = input.askForChoice(options: optionStrings)
        let function = options[selected]!
        function()
    }
    
    func resetDeck() {
        deck.reset()
        output.show("카드 전체를 초기화했습니다.")
        showDeckCount()
    }
    
    func shuffleDeck() {
        deck.shuffle()
        output.show("전체 \(deck.count())장의 카드를 섞었습니다.")
    }
    
    func showDeckCount() {
        output.show("총 \(deck.count())장의 카드가 있습니다.")
    }
    
    func removeOne() {
        if let card = deck.removeOne() {
            output.show("\(card)")
            showDeckCount()
            return
        }
        output.show("제거할 카드가 없습니다")
    }
}
