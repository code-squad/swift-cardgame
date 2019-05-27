//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ Participant: (players: [Player], dealer: Dealer)) {
        let playersSorted = Participant.players.sorted(by: { (arg0, arg1) -> Bool in
            return arg0.name < arg1.name
        })
        
        for player in playersSorted {
            print(player)
        }
        
        print(Participant.dealer)
    }
    
    
}
