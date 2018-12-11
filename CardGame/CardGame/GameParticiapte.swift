//
//  ParticipatablePlayer.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardRule {
    case onePair
    case twoPair
    case tripple
    case fourCard
    case noPair
}

class GameParticipate {
    var cards: [Card]
    var name: String
    var state: CardRule
    
    init(_ name: String) {
        cards = []
        self.name = name
        self.state = .noPair
    }

    func receiveCard(_ cards: [Card]) {
        self.cards = cards
    }
    
    func judgeMyCard() {
        let tempCard = cards.sorted(by: {$0.number.rawValue < $1.number.rawValue})
        guard !judgeFourCard(of: tempCard) else {
            state = .fourCard
            return
        }
        guard !judgeTripple(of: tempCard) else {
            state = .tripple
            return
        }
        guard !judgeTwoPair(of: tempCard) else {
            state = .twoPair
            return
        }
        guard !judgeOnePair(of: tempCard) else {
            state = .onePair
            return
        }
    }
    
    private func judgeFourCard(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-3 {
            if sortedCard[index].number == sortedCard[index+1].number && sortedCard[index+1].number == sortedCard[index+2].number && sortedCard[index+2].number == sortedCard[index+3].number { return true }
        }
        return false
    }
    
    private func judgeTripple(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-2 {
            if sortedCard[index].number == sortedCard[index+1].number && sortedCard[index+1].number == sortedCard[index+2].number { return true }
        }
        return false
    }
    
    private func judgeTwoPair(of sortedCard: [Card]) -> Bool {
        var pairCount: Int = 0
        for index in 0..<sortedCard.count-1 {
            if pairCount == 2 { return true }
            if sortedCard[index].number == sortedCard[index+1].number { pairCount += 1 }
        }
        return false
    }
    
    private func judgeOnePair(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-1 {
            if sortedCard[index].number == sortedCard[index+1].number { return true }
        }
        return false
    }
}
