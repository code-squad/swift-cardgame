//
//  CardGameResult.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


typealias GameWinner = (name: String, type: String)

class CardGameResult {
    private var playerList : [GamePlayer]
    
    init(_ players: [GamePlayer]){
        self.playerList = players
        sortPlayerCardDeck()
    }
    
    private func sortPlayerCardDeck() {
        for player in self.playerList {
            player.sortDeck()
        }
    }
    
    func decideWinningType(_ score: Int) -> String{
        let result = CardScore(score)
        return result.description
    }
    
    func selectWinnerName() -> GameWinner {
        self.playerList.sort { (player1, player2) -> Bool in
            player1.priority > player2.priority
        }
        let winner = playerList[0]
        let winType = decideWinningType(winner.priority)
        return GameWinner(name: winner.name, type: winType)
    }
}
