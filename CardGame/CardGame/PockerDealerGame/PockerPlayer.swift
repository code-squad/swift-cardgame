//
/******************************************************************************
 * File Name        : PockerPlayer.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

class PockerPlayer {
    var result: String {
        return self.name + self.printCardInHand()
    }
    
    enum Role: CustomStringConvertible {
        case dealer
        case player
        
        var description: String {
            switch self {
            case .dealer: return "딜러"
            case .player: return "참가자#"
            }
        }
        
    }
    private let name: String
    private(set) var cardsInHand: [Card] = []
    
    public init(role: Role, backNumber:Int) {
        let name = String(role.description + (role == .player ? String(backNumber) : "") )
        self.name = name
    }
    
    public func receiveCard(_ newCard: Card) {
        self.cardsInHand.append(newCard)
    }
    
    public func clearCardInHand() {
        self.cardsInHand.removeAll()
    }
    
    public func printCardInHand() -> String {
        var output:String = ""
        output = " ["
        for card in cardsInHand {
            output += card.description
            output += ", "
        }
        if cardsInHand.count > 1 {
            output.removeLast(2)
        }
        output += "]"
        
        return output
    }
}
