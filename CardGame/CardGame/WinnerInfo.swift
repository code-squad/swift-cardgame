//
//  Winner.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct WinnerInfo {
    var handOfWinner : Hand.HandRanks
    var numberOfWinner : Int = 0
    
    init(_ hand : Hand.HandRanks, _ number : Int) {
        self.handOfWinner = hand
        self.numberOfWinner = number
    }
    
    func isDealer(_ gameInfo : CardGameInfo) -> Bool {
        return self.numberOfWinner == gameInfo.numberOfPlayers.rawValue
    }
    
    static func getRanksPoint (_ cards: Array<Array<Card>>) {
        for card in cards {
            print (card)
        }
        var ranks = [Int]()
        for card in cards {
            let a = Hand().makeHandRanks(card)
            let b = Hand().countResult(a)
            ranks.append(b)
        }
        print ("sadasd",ranks)
    }
    
}
