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
