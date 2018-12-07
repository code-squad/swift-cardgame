//
//  Dealer.swift
//  CardGame
//
//  Created by 윤동민 on 07/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Dealer {
    var deck: CardDeck
    var cards: [Card]
    
    init(of deck: CardDeck) {
        self.deck = deck
        cards = []
    }
    
    // 카드패를 사용자들에게 나누어줌
    func distributeCardToPlayer(to players: [Player], what stack: [[Card]]) {
        var cardOrder = 0
        for player in players {
            player.receiveCards(stack[cardOrder])
            cardOrder += 1
        }
    }
    
    // 사용자에게 나눠줄 패들을 만듬
    func makeCardStack(by menu: Int, with players: Int) -> [[Card]] {
        var cardStack : [[Card]] = []
        cards = makeOneStack(by: menu)
        for _ in 0..<players { cardStack.append(makeOneStack(by: menu)) }
        return cardStack
    }
    
    // 한 사용자의 패를 만듦
    private func makeOneStack(by menu: Int) -> [Card] {
        var playerCards : [Card] = []
        for _ in 0..<menu {
            guard let pickCard = deck.removeOne() else { return [] }
            playerCards.append(pickCard)
        }
        return playerCards
    }
}
