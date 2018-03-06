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
    private (set) var name: String = ""
    private var cardSet: [Card] = [Card]()
    
    init(_ nameIndex: Int, _ cardSet: [Card]) {
        self.name = makeName(nameIndex)
        self.cardSet = cardSet
        self.point = makePoint()
    }
    
    init(dealer: Dealer, nameIndex: Int, cardSet: [Card]) {
        self.name = dealer.makeName(nameIndex)
        self.cardSet = cardSet
        self.point = makePoint()
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
    private func makePoint() -> Int {
        return Hand(self.cardSet).countResult()
    }
    
    func getTopCard () -> Card {
        let sortedCard = self.cardSet.sorted { $0 > $1 }
        return sortedCard[0]
    }
    
    private func makeName(_ index: Int) -> String {
        return "참가자\(index)#유저 "
    }
    
    func getWinnerInfo () -> String {
        let winnerHandName = PlayingGame.getWinnerHandName(point: self.point)
        return "🤩 승자는 \(self.name)이고 \(winnerHandName.rawValue) \(self.point)점 입니다."
    }
    
    func printEachPlayersCards(result: (_ name: String, _ cards: [Card]) -> ()) {
        result(self.name, self.cardSet)
    }
    
}
