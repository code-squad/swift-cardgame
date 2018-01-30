//
//  Player.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Player: Comparable {
    private var point: Int = 0
    private var name: String = ""
    private var cardSet: [Card] = [Card]()
    init(_ nameIndex: Int, _ cardSet: [Card]) {
        self.name = makeName(nameIndex)
        self.point = makePoint(cardSet)
        self.cardSet = cardSet
    }
    
    init(dealer: Dealer, nameIndex: Int, cardSet: [Card]) {
        self.name = dealer.makeName(nameIndex)
        self.point = makePoint(cardSet)
        self.cardSet = cardSet
    }
    
    var nameDescription: String {
        return self.name
    }
    
    var pointDescription: Int {
        return self.point
    }
    
    var cardDescription: [Card] {
        return self.cardSet
    }
    
    static func <(lhs: Player, rhs: Player) -> Bool {
        return lhs.point < rhs.point
    }
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.point == rhs.point
    }
    
    static func >(lhs: Player, rhs: Player) -> Bool {
        return lhs.point > rhs.point
    }
    func makePoint(_ cards: [Card]) -> Int {
        return Hand.countResult(cards)
    }
    
    func makeName(_ index: Int) -> String {
        return "참가자\(index)#유저 "
    }

}
