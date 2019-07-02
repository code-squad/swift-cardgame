//
//  OutputView.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printDealtCards(of players: [Player]) {
        var participantCount = 0
        
        for player in players {
            switch player {
            case is Participant:
                participantCount += 1
                print("\(Participant.typeDescription)#\(participantCount) \(player.cards)")
            case is Dealer:
                print("\(Dealer.typeDescription) \(player.cards)")
            default:
                return
            }
        }
        print() //for new line
    }
}
