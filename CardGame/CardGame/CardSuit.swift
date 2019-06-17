//
//  CardSuit.swift
//  CardGame
//
//  Created by jang gukjin on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardSuit {
    case diamond, heart, clover, spade
    
    var suit: String {
        switch self {
        case .diamond : return "♦️" 
        case .heart : return "♥️"
        case .clover : return "♣️"
        case .spade : return "♠️"

        }
    }
}
