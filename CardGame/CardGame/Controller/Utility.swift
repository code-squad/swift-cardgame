//
//  Utility.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardGameError : Error {
    case invalidMenumNumber
    case emptyCardDeck
    case ownCardNotExist
}

enum KindOfGame {
    case SevenCardStud
    case FiveCardStud
    
    var numberOfCards : Int {
        switch self {
        case .SevenCardStud :
            return 7
            
        case .FiveCardStud :
            return 5
        }
    }
}

enum PokerHandRankings {
    case HighCard(rank: Card.Rank)
    case OnePair(rank: Card.Rank)
    case TwoPair(rank: Card.Rank)
    case Triple(rank: Card.Rank)
    case Straight(rank: Card.Rank)
    case FourCard(rank: Card.Rank)
    
    var score : Int {
        switch self {
        case .HighCard(let rank) :
            return rank.rawValue
        case .OnePair(let rank):
            return Card.Rank.king.rawValue * 1 + rank.rawValue
        case .TwoPair(let rank):
            return Card.Rank.king.rawValue * 2 + rank.rawValue
        case .Triple(let rank):
            return Card.Rank.king.rawValue * 3 + rank.rawValue
        case .Straight(let rank):
            return Card.Rank.king.rawValue * 4 + rank.rawValue
        case .FourCard(let rank):
            return Card.Rank.king.rawValue * 5 + rank.rawValue
        }
    }
}

struct Utility {
    static func inputValueValidator(userInput: String, menu: Menu) throws -> Int {
        // pasing
        let choiceTrimmed = userInput.filter { !$0.isNewline && !$0.isWhitespace }
        guard let choosenMenu = Int(choiceTrimmed) else {
            throw CardGameError.invalidMenumNumber
        }
        
        switch menu {
        case .cardDeckTest :
            guard choosenMenu >= 1 && choosenMenu <= 3 else {
                throw CardGameError.invalidMenumNumber
            }
        case .kindOfGame :
            guard choosenMenu >= 1 && choosenMenu <= 2 else {
                throw CardGameError.invalidMenumNumber
            }
            
        case .numberOfPlayer :
            guard choosenMenu >= 1 && choosenMenu <= 4 else {
                throw CardGameError.invalidMenumNumber
            }
        }
        
        return choosenMenu
    }
    
    static func getKindOfGame(chooseMenu: Int) throws -> KindOfGame{
        switch chooseMenu {
        case 1 :
            return .SevenCardStud
        case 2 :
            return .FiveCardStud
        default :
            throw CardGameError.invalidMenumNumber
        }
    }
}
