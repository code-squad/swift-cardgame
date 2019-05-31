//
//  Human.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Participant: CustomStringConvertible {
    func changeCardsToString(_ cards: [Card]) -> String
}

extension Participant {
    internal func changeCardsToString (_ cards: [Card]) -> String {
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

