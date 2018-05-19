//
//  CardGame.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

class Card {
    
    enum Suits : String {
        case spade = "♠"
        case clover = "♣"
        case heart = "♥"
        case diamond = "◆"
    }
    
    enum Rank: String {
        case King
        case Queen
        case Jack
        case Ace
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
    }
}
