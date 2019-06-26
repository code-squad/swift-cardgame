//
//  Card.swift
//  CardGame
//
//  Created by Daheen Lee on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    
    // 4가지 기호 - case 별로 처리하기에 적절하다고 판단하여 enum 으로 구현
    enum Suit: Character {
        case spade   = "\u{2660}" //♠︎
        case club    = "\u{2663}" //♣︎
        case heart   = "\u{2665}" //♥︎
        case diamond = "\u{2666}" //♦︎
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
}

