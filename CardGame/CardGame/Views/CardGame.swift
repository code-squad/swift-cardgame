//
//  CardGame.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private var players: [Player]
    private var dealer: Dealer
    private let gameMode: CardGameMode
    
    init(players: [Player], dealer: Dealer, gameMode: CardGameMode) {
        self.dealer = dealer
        self.players = players
        self.gameMode = gameMode
    }
    
    mutating private func continueGame() -> Bool {
        let numberOfCards = gameMode.numberOfCards
        let requirement = numberOfCards * players.count
        return dealer.haveCards(requirement: requirement)
    }
    
    mutating func Gamestart() {
        guard continueGame() else { return }
        func setPlayer() {}
        func give() {

        }
        
    }
}
    

    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
