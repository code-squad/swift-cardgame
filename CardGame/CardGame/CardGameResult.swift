//
//  CardGameResult.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardGameResult {
    private var player : GamePlayer
    private var scores: Int
    init(_ player: GamePlayer){
        self.player = player
        scores = 0
    }
    
    func sortPlayerCardDeck() {
//        for player in self.playerList {
            player.sortMyDeck()
//        }
    }
    
    private func calculateScores(){
//        for (index, player) in playerList.enumerated(){
            scores = calculateEachPlayerHand(player)
//        }
    }
    private func calculateEachPlayerHand(_ player: GamePlayer) -> Int{
        var maxScore = player.myCardDeck[player.myCardDeck.count-1].number.rawValue * CardScore.highCard.rawValue
        
        return maxScore
    }
    private func onePairCheck(_ deck: [Card]) -> Int {
        var onePairScore = 0
        var count = 0
        for index in deck.startIndex..<deck.endIndex {
            print(index)
        }
        
        return onePairScore * CardScore.onePair.rawValue
    }
}
