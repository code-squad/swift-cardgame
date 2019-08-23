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
    private var rank: Rank {
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
    
    func getWinnerName(handler: @escaping (String) -> ()) {
        handler(name)
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.rank == rhs.rank
    }
}
