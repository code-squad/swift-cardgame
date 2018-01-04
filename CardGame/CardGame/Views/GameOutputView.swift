//
//  GameOutputView.swift
//  CardGame
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import Foundation

struct GameOutputView {
    static func printResult(_ pokerGameData: PokerGameData) {
        printPlayers(players: pokerGameData.playersInformation)
        printDealer(dealer: pokerGameData.dealerInformation)
    }
    
    private static func printPlayers(players: [Player]) {
        for player in players {
            print("\(player.nameInformation) \(player.handInformation.description)")
        }
    }
    
    private static func printDealer(dealer: Dealer) {
        print("\(dealer.nameInformation) \(dealer.handInformation.description)")
    }
}


