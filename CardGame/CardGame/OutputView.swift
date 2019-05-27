//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ human: (players: [Player], dealer: Dealer)) {
        let playersSorted = human.players.sorted(by: { (arg0, arg1) -> Bool in
            return arg0.name < arg1.name
        })
        
        for player in playersSorted where player.name != "딜러" {
            print("\(player.name) " + changeCardsToString(player.cards))
        }
        
        print("\(human.dealer.name) " + changeCardsToString(human.dealer.cards))
    }
    
    private func changeCardsToString (_ cards: [Card]) -> String {
        var cardString: String = "["
        
        for card in cards {
            cardString += "\(String(describing: card)), "
        }
        
        cardString.removeLast()
        cardString.removeLast()
        
        cardString += "]"
        
        return cardString
    }
}
