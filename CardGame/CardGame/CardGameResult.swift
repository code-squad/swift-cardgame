//
//  CardGameResult.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


typealias GameWinner = (name: [String], type: String)

class CardGameResult {
    private var playerList : [GamePlayer]
    
    init(_ players: [GamePlayer]){
        self.playerList = players
        sortPlayerCardDeck()
    }
    
    func selectWinnerName() -> GameWinner {
        sortPlayerByDescendingOrderScore()
        let winners = hasMoreWinner(playerList[0])
        let winType = decideWinningType(playerList[0].score)
        return GameWinner(name: winners, type: winType)
    }
    
    private func hasMoreWinner(_ player: GamePlayer) -> [String] {
        var result = [String]()
        result.append(player.name)
        for candidateIndex in 1..<playerList.count {
            if player == playerList[candidateIndex]{
                result.append(playerList[candidateIndex].name)
            }
        }
        return result
    }
    
    private func sortPlayerByDescendingOrderScore() {
        self.playerList.sort { (player1, player2) -> Bool in
            player1 > player2
        }
    }
    
    private func sortPlayerCardDeck() {
        for player in self.playerList {
            player.sortDeck()
        }
    }
    
    private func decideWinningType(_ score: Int) -> String{
        let result = CardScore(score)
        return result.description
    }
}
