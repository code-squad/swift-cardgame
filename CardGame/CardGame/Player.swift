//
//  Player.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player: Playable {
    private var cards: [Card] = []
    private var name: String
    private var rank: (HandRank, Card) {
        return RankDeterminer.determineRank(cards: cards)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    func getPlayerInformation(handler: (String, [Card]) -> ()) {
        handler(name, cards)
        cards.removeAll()
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        if lhs.rank.0.rawValue == rhs.rank.0.rawValue {
            return lhs.rank.1 < rhs.rank.1
        }
        
        return lhs.rank.0.rawValue < rhs.rank.0.rawValue
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        if lhs.rank.0.rawValue == rhs.rank.0.rawValue {
            return lhs.rank.1 == rhs.rank.1
        }
        
        return lhs.rank.0.rawValue == rhs.rank.0.rawValue
    }
}
