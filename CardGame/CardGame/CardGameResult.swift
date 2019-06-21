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
        var currentMaxScore = 0
        var currentIndex = 0
        for (index, player) in playerList.enumerated(){
            let currentPlayerScore = player.getScore()
            if currentMaxScore < currentPlayerScore {
                currentMaxScore = currentPlayerScore
                currentIndex = index
            }
        }
        let winType = decideWinningType(currentMaxScore)
        return GameWinner(name: playerList[currentIndex].name, type: winType)
    }
}
