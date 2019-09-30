//
//  PockerPlayerRegistry.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PockerPlayerRegistry {

    private(set) var players: [PockerPlayable]
    
    init(dealer: PockerPlayable, numberOfPlayers: Int) {
        players = [dealer]
        Array(0..<numberOfPlayers).forEach {
            let player = PockerPlayer(name: "참가자#\($0+1)", cards: [])
            self.players.append(player)
        }
    }
    
    private init(players: [PockerPlayable]) {
        self.players = players
    }
    
    func distributeCard(with cardDeck: CardDeck) -> (registry: PockerPlayerRegistry, cardDeck: CardDeck) {
        var deck = cardDeck
        return (PockerPlayerRegistry(players: players.map {
            let result = deck.removeOne()
            deck = result.cardDeck
            return $0.updated(by: $0.cards + [result.removedCard])
        }), deck)
    }
    
    func reset() -> PockerPlayerRegistry {
        return PockerPlayerRegistry(players: players.map {
            return $0.updated(by: [])
        })
    }
}

extension PockerPlayerRegistry: CustomStringConvertible {
    var description: String {
        return players.map { "\($0.name) \($0.description)" }.joined(separator: "\n")
    }
}
