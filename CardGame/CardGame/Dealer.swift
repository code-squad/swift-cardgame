//
//  Dealer.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 7..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Dealer: GamePlayer {
    static var deck : CardGameDeck = Deck()
    
    private let name = "딜러"
    private var cards : [Card]
    
    var description: String {
        return "\(self.name) \(self.cards)"
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    func showCardInHand() {
        print(self.cards, terminator:"")
    }
    
    func showName() {
        print(self.name, terminator:"")
    }
    
    static func distributeCard(gameType:Int, numberOfParticipant:Int) -> [GamePlayer] {
        var gamePlayers = [GamePlayer]()
        deck.shuffle()
        for number in 1...numberOfParticipant {
            gamePlayers.append(Participant.init(name: "참가자#\(number)",cards: deck.draw(few: gameType)))
        }
        gamePlayers.append(Dealer.init(cards: deck.draw(few: gameType)))
        return gamePlayers
    }
    
    static func numberOfDeck() -> Int {
        return self.deck.count()
    }
}

