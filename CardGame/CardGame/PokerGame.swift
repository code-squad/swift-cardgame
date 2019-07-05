//
//  PokerGame.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PokerGame {
    
    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
    private var dealer: Dealer
    private var players: [Player]
    private let option: GameOption
    
    init(dealer: Dealer, players: [Player], option: GameOption) {
        self.dealer = dealer
        self.players = players + [dealer as Player]
        self.option = option
    }
    
    mutating func run() throws {
        let times = option.numberOfCards
        
        for index in 0..<players.count {
            for _ in 0..<times {
                guard let card = dealer.give() else {
                    throw Error.isCardDeckEmpty
                }
                players[index].receive(card: card)
            }
        }
    }
}
