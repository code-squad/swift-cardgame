//
//  PlayersInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 06/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayersInfo {
    private var players: [Player] = []
    private let dealer: Dealer<CardDeck>
    
    init(playersNum: Int, dealer: Dealer<CardDeck>) {
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
    
    func showSettingResult(with result: (Bool, String, CardsInfo) -> Void) {
        for player in players {
            let dealer = player as? Dealer<CardDeck>
            let isDealer = dealer != nil
            let order = isDealer ? "" : "\(player.showOrder())"
            let cards = player.showCards()
            result(isDealer, order, cards)
        }
    }
    
    func showWinner(with result: (Bool, String) -> Void) {
        guard let winner = players.max() else { return }
        let dealer = winner as? Dealer<CardDeck>
        let isDealer = dealer != nil
        let order = isDealer ? "" : "\(winner.showOrder())"
        result(isDealer, order)
    }
}
