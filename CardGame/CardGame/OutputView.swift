//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ result: [String: [Card]]) {
        let resultSorted = result.sorted(by: { (arg0, arg1) -> Bool in
            return arg0.key < arg1.key
        })
        
        for (userName, cards) in resultSorted where userName != "딜러" {
            print("\(userName) " + changeCardsToString(cards))
        }
        
        if let dealerCards = result["딜러"] {
            print("딜러 " + changeCardsToString(dealerCards))
        }
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
