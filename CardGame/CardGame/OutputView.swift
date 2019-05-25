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
        for (userName, cards) in result {
            print("\(userName) " + changeCardsToString(cards))
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
