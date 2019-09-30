//
//  PlayingCard.swift
//  CardGame
//
//  Created by temphee.Reid on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PlayingCard {
    
    // suit 는 하나의 카드에 포함되는 속성이기 때문에 PlayingCard 의 nested enum 으로 표현함
    enum Suit : String { // playing card symbols
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
    }
    
    // rank 또한 하나의 카드에 포함되는 속성이기 때문에 PlayingCard 의 nested enum 으로 표현함
    enum Rank : Int, CustomStringConvertible { // plyaing card numbers
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack = 11
        case queen = 12
        case king = 13
        
        var description: String {
            switch(self) {
            case .ace :
                return "A"
            case .jack :
                return "J"
            case .queen :
                return "Q"
            case .king :
                return "K"
            default :
                return "\(self.rawValue)"
            }
        }
    }
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension PlayingCard : CustomStringConvertible {
    var description: String {
        return "\(self.suit.rawValue)\(self.rank)"
    }
}
