//
//  Card.swift
//  CardGame
//
//  Created by jack on 2018. 1. 6..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    var suit : Suits, rank : Ranks
    
    init(_ suit : Suits   , _ rank : Ranks) {
        self.suit = suit
        self.rank = rank
    }
    
    //하나의 범주로 묶어 사용하고, 한정된 값들이기 때문에 enum을 선택하였습니다.
    enum Suits : String {
        case spade = "♠"
        case heart = "♥"
        case diamond = "◆"
        case club = "♣"
    }
    
    enum Ranks : String {
        case one = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
    }
    
    func generateOneCard() -> String {
        return "\(self.suit.rawValue)\(self.rank.rawValue)"
    }
}
