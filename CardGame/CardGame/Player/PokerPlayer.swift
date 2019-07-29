//
// Participant.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PokerPlayer: Player, Comparable {
    
    var hand = Hand()
    var name: String
    let number: Int
    
    init(number: Int, name: String) {
        self.number = number
        self.name = "\(name)#\(number)"
    }
    
    func receive(newCards: Card) {
        hand.add(card: newCards)
    }
    
    func clearHand() {
        self.hand.clear()
    }
    
    func handRank() -> (HandRank, Int) {
        return hand.makeHandRank()
    }
    
    static func < (lhs: PokerPlayer, rhs: PokerPlayer) -> Bool {
        if (lhs.handRank().0 != rhs.handRank().0){
            return lhs.handRank().0 < rhs.handRank().0
        } else {
        return lhs.handRank().1 < lhs.handRank().1
        }
    }
    
    static func == (lhs: PokerPlayer, rhs: PokerPlayer) -> Bool {
        if (lhs.handRank().0 == rhs.handRank().0) {
            return lhs.handRank().1 == rhs.handRank().1
        } else {
            return false
        }
    }
}
