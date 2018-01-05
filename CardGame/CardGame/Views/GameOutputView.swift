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
        printWinner(winner: pokerGameData.confirmWinner())
    }
    
    private static func printPlayers(players: [Player]) {
        for player in players {
            print("\(player.nameInformation) \(player.handInformation.description)")
        }
    }
    
    private static func printDealer(dealer: Dealer) {
        print("\(dealer.nameInformation) \(dealer.handInformation.description)")
    }
    
    private static func printWinner(winner: (Player, HandType)) {
        let (winner, winnerHandType) = winner
        print("------------------------------------------------")
        print("제일 높은 점수는 \(winnerHandType.description)이며, 게임 승자는 \(winner.nameInformation) 입니다.")
        print("------------------------------------------------")
    }
}


