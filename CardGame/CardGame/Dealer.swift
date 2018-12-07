//
//  Dealer.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 7..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Dealer: GamePlayer {
    private let name = "딜러"
    private var cards : [Card]
    
    func showCardInHand() {
        print(self.cards, terminator:"")
    }
    
    func showName() {
        print(self.name, terminator:"")
    }
    
    static func cardDistribution(gameType:String, numberOfParticipant:Int) -> [GamePlayer] {
        var gamePlayers = [GamePlayer]()
        var nubmerOfDistributionCard = 0

        
        return gamePlayers
    }
}

