//
//  PokerHand.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PokerHand {
    static func ranking(cards: NSMutableArray) throws -> PokerHandRankings {
        guard var myCards = cards as NSArray as? [Card] else {
            throw CardGameError.ownCardNotExist
        }
        
        myCards.sort(by: {$0.rank > $1.rank})
        
        if findSameRank(myCards, 4).count > 0 {
            let fourCard = findSameRank(myCards, 4)
            return PokerHandRankings.FourCard(rank: fourCard[0].rank)
        }
        else if findStraight(myCards).count > 0 {
            let straight = findStraight(myCards)
            return PokerHandRankings.Straight(rank: straight[0].rank)
        }
        else if findSameRank(myCards, 3).count > 0 {
            let triple = findSameRank(myCards, 3)
            return PokerHandRankings.Triple(rank: triple[0].rank)
        }
        else if findSameRank(myCards, 2).count > 0 {
            let pair = findSameRank(myCards, 2)
            
            if pair.count >= 3 {
                return PokerHandRankings.TwoPair(rank: pair[0].rank)
            }
            else {
                return PokerHandRankings.OnePair(rank: pair[0].rank)
            }
        }
        else {
            return PokerHandRankings.HighCard(rank: myCards[0].rank)
        }
    }
    
    private static let findSameRank: ([Card], Int) -> [Card] = {
        (holdCards: [Card], numberOfSameRank: Int) in
        return Array(holdCards.filter({ (card: Card) in holdCards.filter({ $0.rank == card.rank }).count >= numberOfSameRank}))
    }
    
    private static var decrease = 0
    private static let findStraight: ([Card]) -> [Card] = {
        (holdCards: [Card]) in
        return Array(holdCards.filter({ (card: Card) in
            decrease=1;
            return holdCards.filter({
                //print("\($0) , \(card) \(decrease) ", terminator: "")
                if $0 == card {
                    //print(" -> true")
                    return true
                }
                else if $0.rank.rawValue == card.rank.rawValue - decrease {
                    decrease += 1;
                    //print(" -> true")
                    return true
                }
                else {
                    //print("")
                    return false
                }
            }).count >= 5}))
        }
    
    
}
