//
//  TexasHoldem.swift
//  CardGame
//
//  Created by jake.you on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PockerGameCriterial {
    func winner(among players: [PockerPlayable]) -> [PockerPlayable]
}

struct TexasHoldem: PockerGameCriterial {
    
    func winner(among players: [PockerPlayable]) -> [PockerPlayable] {
        let sortedResult = players.compactMap { (player) -> (player: PockerPlayable, handValue: HandValue, rank: Card.Rank)? in
            guard let evalutation = evaluate(cards: player.cards) else {
                return nil
            }
            return (player: player, handValue: evalutation.handValue, rank: evalutation.rank)
            }.sorted { $0.handValue > $1.handValue }

        return sortedResult.filter({ $0.handValue == sortedResult.first?.handValue && $0.rank == sortedResult.first?.rank }).map({ $0.player })
    }
    
    private func evaluate(cards: [Card]) -> (handValue: HandValue, rank: Card.Rank)? {
        guard let ret =  straight(in: cards), ret.exist else {
            return pairs(in: cards)
        }
        return (handValue: HandValue.straight, rank: ret.rank)
    }
    
    private func straight(in cards: [Card]) -> (exist: Bool, rank: Card.Rank)?  {
        let sortedCards = cards.sorted { $0.rank.rawValue > $1.rank.rawValue }
        guard sortedCards.count > 0 else {
            return nil
        }
        for startIdx in 0..<sortedCards.count {
            let lastIndex = min(startIdx+4, sortedCards.count-1)
            let rangedCards = Array(sortedCards[startIdx...lastIndex])
            var gap = 0
            for i in 0..<rangedCards.count-1 {
                gap += (rangedCards[i].rank.rawValue - rangedCards[i+1].rank.rawValue)
            }
            let uniqueNumbers = sortedCards[startIdx...lastIndex].map { $0.rank.rawValue }
            if Set(uniqueNumbers).count == 5, gap == 4 {
                return (true, sortedCards.first!.rank)
            }
        }
        return (false, sortedCards.first!.rank)
    }
    
    private func pairs(in cards: [Card]) ->  (handValue: HandValue, rank: Card.Rank)? {
        let sortedCards = Dictionary(cards.map { ($0.rank, 1) }, uniquingKeysWith: +).sorted { $0.value > $1.value }
        guard sortedCards.count > 0, let firstCard = sortedCards.first else {
            return nil
        }
        var result: (handValue: HandValue, rank: Card.Rank)
        switch (sortedCards.first?.value, sortedCards.filter { $0.value == 2 }.count) {
        case (4, _): result = (handValue: HandValue.fourCard, rank: firstCard.key)
        case (3, _): result = (handValue: HandValue.triple, rank: firstCard.key)
        case (2, 2): result = (handValue: HandValue.twoPairs, rank: firstCard.key)
        case (2, 1): result = (handValue: HandValue.pair, rank: firstCard.key)
        default: result = (handValue: HandValue.highCard, rank: firstCard.key)
        }
        return result
    }
}
