//
//  ScoreFactory.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ScoreFactory: Factory {
    typealias IN = [Card]
    typealias OUT = Score
    
    static func create(_ input: [Card]) -> Score? {
        return self.createStraight(input) ?? .highCard(top: input[0])
    }
    
    static func createHighCard(_ cards: [Card]) -> Score? {
        
        return nil
    }
    
    static func createOnePair(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createTwoPair(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createTrips(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createStraight(_ cards: [Card]) -> Score? {
        let seeds = cards
            .map { groupSeries(one: $0, others: cards) }
            .filter { $0.count >= 5 }
            .compactMap { $0.max() }
        guard let topCard = seeds.max() else { return nil }
        return Score.straight(top: topCard)
    }
    
    static func createFourCard(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func grouping(one: Card, others: [Card]) -> [Card] {
        return others.filter{ one.isPair(with: $0) }
    }
    
    static func groupSeries(one: Card, others: [Card]) -> [Card] {
        var cards = others.sorted(by: <)
        var series = [one] { didSet { series.sort() } }
        let isLink = { series.first!.isLink(with: $0) || series.last!.isLink(with: $0) }
        let isRepetition = { series.first!.isPair(with: $0) || series.last!.isPair(with: $0) }
        cards.forEach { isLink($0) && !isRepetition($0) ? series.append($0) : () }
        return series
    }
    
}
