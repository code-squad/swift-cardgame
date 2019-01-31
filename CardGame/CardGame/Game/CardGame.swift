//
//  CardGame.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
//GameMode : 1번을 누르면 7장 카드 , 2번을 누르면 5장의 카드를 출력하기 위해
enum GameMode: Int, CaseIterable {
    case sevenCard = 1 , fiveCard
    
    var modeCardNumber: Int {
        switch self {
        case .sevenCard:
            return 7
        case .fiveCard:
            return 5
        }
    }
}

protocol GamePlayer {
    func take(card: Card)
    func showCards() -> String
    func resetCards()
}

class CardGame {
    private let gameMode: GameMode
    let gameMakePlays: GameMakePlayers
    
    init(gameMode: GameMode, players: Int){
        self.gameMode = gameMode
        let make = GameMakePlayers.init(players: players)
        self.gameMakePlays = make
    }
    
    private func reset() {
        for player in gameMakePlays.gamePlayers {
            player.resetCards()
        }
    }
    
    func play() -> Bool {
        reset()
        guard gameMakePlays.sendRound(gameMode.modeCardNumber) else { return false }
        return true
    }

}
