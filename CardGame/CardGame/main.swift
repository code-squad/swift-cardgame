//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

class PlayingCard {
    enum Suit : String { // playing card symbols
        case spades = "♠"
        case hearts = "♥"
        case diamonds = "♦"
        case clubs = "♣"
    }
    
    enum Rank : Int { // plyaing card numbers
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
        
        func toString() -> String {
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
    
    func PritabaleValue() -> String {
        return "\(self.suit)\(self.rank.toString())"
    }
}







