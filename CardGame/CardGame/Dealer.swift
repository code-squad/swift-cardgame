//
//  Dealer.swift
//  CardGame
//
//  Created by 윤동민 on 07/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Dealer : GameParticipate {
    private var deck: CardDeck
    
    init(of deck: CardDeck) {
        self.deck = deck
    }
    
    // 카드패를 사용자들에게 나누어줌
    func distributeCardToPlayer(to players: [GameParticipate], by count: Int) {
        for player in players { player.receiveCard(makeOneStack(by: count)) }
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
