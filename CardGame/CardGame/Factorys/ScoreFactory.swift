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
        let score = FactoryMethod.allCases.compactMap { $0.logic(input) }
        guard let best = score.max() else { return nil }
        return best
    }
    
}
// - MARK: - + Factory Method
extension ScoreFactory {
    
    typealias Grouping =  (Card,[Card]) -> [Card]

    enum FactoryMethod: CaseIterable {
        case highCard
        case onePair
        case twoPair
        case trips
        case straight
        case fourCard
        
        var logic: ([Card]) -> Score? {
            switch self {
            case .highCard:
                return createHighCard(_:)
            case .onePair:
                return createOnePair(_:)
            case .twoPair:
                return createTwoPair(_:)
            case .trips:
                return createTrips(_:)
            case .straight:
                return createStraight(_:)
            case .fourCard:
                return createFourCard(_:)
            }
        }
        
        private func createHighCard(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupPair(_:_:), count: 1)
            guard let topCard = seeds.max() else { return nil }
            return Score.highCard(top: topCard)
        }
        
        private func createOnePair(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupPair(_:_:), count: 2)
            guard let topCard = seeds.max() else { return nil }
            return Score.onePair(top: topCard)
        }
        
        private func createTwoPair(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupPair(_:_:), count: 2)
            guard let topCard = seeds.max() , seeds.count > 2 else { return nil }
            return Score.twoPair(top: topCard)
        }
        
        private func createTrips(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupPair(_:_:), count: 3)
            guard let topCard = seeds.max() else { return nil }
            return Score.trips(top: topCard)
        }
        
        private func createStraight(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupSeries(_:_:), count: 5)
            guard let topCard = seeds.max() else { return nil }
            return Score.straight(top: topCard)
        }
        
        private func createFourCard(_ cards: [Card]) -> Score? {
            let seeds = getSeeds(cards: cards, grouping: groupPair(_:_:), count: 4)
            guard let topCard = seeds.max() else { return nil }
            return Score.fourCard(top: topCard)
        }
        
        private func getSeeds(cards: [Card], grouping: Grouping, count: Int) -> [Card] {
            let seeds = cards
                .map { grouping($0,cards) }
                .filter { $0.count >= count }
                .compactMap { $0.max() }
            return seeds
        }
        
        private func groupPair(_ one: Card, _ others: [Card]) -> [Card] {
            return others.filter{ one.isPair(with: $0) }
        }
        
        private func groupSeries(_ one: Card, _ others: [Card]) -> [Card] {
            var cards = others.sorted(by: <)
            var series = [one] { didSet { series.sort() } }
            let isLink = { series.first!.isLink(with: $0)||series.last!.isLink(with: $0) }
            let isRepetition = { series.first!.isPair(with: $0)||series.last!.isPair(with: $0) }
            cards.forEach { isLink($0) && !isRepetition($0) ? series.append($0) : () }
            return series
        }
        
    }
}
