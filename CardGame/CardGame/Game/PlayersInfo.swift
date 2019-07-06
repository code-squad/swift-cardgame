//
//  PlayersInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 06/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayersInfo {
    var players: [Playerable] = []
    private let dealer: Dealerable & Playerable
    
    init(playersNum: Int, dealer: Dealerable & Playerable) {
        self.dealer = dealer
        setPlayers(num: playersNum)
    }
    
    private mutating func setPlayers(num: Int) {
        for order in 1...num {
            self.players.append(Player(order: order))
        }
        self.players.append(dealer)
    }
    
    func setCards(num: Int) {
        for _ in 1...num {
            for player in players {
                guard let card = dealer.deal() else { return }
                player.take(card: card)
            }
        }
    }
    
    func showSettingResult(with result: (Bool, String, String) -> Void) {
        for player in players {
            let participant = player as? Player
            let isPlayer = participant != nil
            let order = isPlayer ? participant!.showOrder() : ""
            let cards = player.showCards()
            result(isPlayer, order, cards)
        }
    }
    
    func showWinner(with result: (Bool, String) -> Void) {
        let sortedByHand = players.sorted {
            if $0.bestHand().value == $1.bestHand().value {
                return $0.bestHand().key < $1.bestHand().key
            }
            return $0.bestHand().value < $1.bestHand().value
        }
        
        let winner = sortedByHand[players.count - 1]
        let participant = winner as? Player
        let isPlayer = participant != nil
        let order = isPlayer ? participant!.showOrder() : ""
        result(isPlayer, order)
    }
}
