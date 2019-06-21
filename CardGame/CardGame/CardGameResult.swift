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
    private var scores: [Int]
    
    init(_ players: [GamePlayer]){
        self.playerList = players
        scores = [Int].init(repeating: 0, count: players.count)
        sortPlayerCardDeck()
        calculateScores()
    }
    
    private func sortPlayerCardDeck() {
        for player in self.playerList {
            player.myHand.sortOwnDeck()
        }
    }
    
    func decideWinningType(_ score: Int) -> String{
        let result = CardScore(score)
        return result.description
    }
    
    func selectWinnerName() -> GameWinner {
        var currentMaxScore = scores[0]
        var currentIndex = 0
        for index in 1..<scores.endIndex{
            if currentMaxScore < scores[index] {
                currentMaxScore = scores[index]
                currentIndex = index
            }
        }
        let winType = decideWinningType(currentMaxScore)
        return GameWinner(name: playerList[currentIndex].name, type: winType)
    }
    
    private func calculateScores(){
        for (index, player) in playerList.enumerated(){
            scores[index] = player.myHand.calculateEachPlayerHand()
        }
    }
}
