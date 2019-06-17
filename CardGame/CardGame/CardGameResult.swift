//
//  CardGameResult.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardGameResult {
    private var playerList : [GamePlayer]
    private var scores: [Int]
    init(_ players: [GamePlayer]){
        self.playerList = players
        scores = [Int]()
    }
    
    func sortPlayerCardDeck() {
        for player in self.playerList {
            player.sortMyDeck()
            print("\(player)")
        }
    }
    
    private func calculateScore(){
        
    }
}
