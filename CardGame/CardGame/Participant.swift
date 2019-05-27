//
//  Human.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Participant: CustomStringConvertible {
    var name: String { get }
    var cards: [Card] { get set }
}

extension Participant {
    var description: String {
        return "\(name) " + changeCardsToString(cards)
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
