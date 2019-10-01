//
//  PokerHand.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum PokerHandRankings {
    case HighCard(rank: Card.Rank)
    case OnePair(rank: Card.Rank)
    case TwoPair(rank: Card.Rank)
    case Triple(rank: Card.Rank)
    case Straight(rank: Card.Rank)
    case FourCard(rank: Card.Rank)
    
    var score : Int {
        switch self {
        case .HighCard(let rank) :
            return rank.rawValue
        case .OnePair(let rank):
            return Card.Rank.king.rawValue * 1 + rank.rawValue
        case .TwoPair(let rank):
            return Card.Rank.king.rawValue * 2 + rank.rawValue
        case .Triple(let rank):
            return Card.Rank.king.rawValue * 3 + rank.rawValue
        case .Straight(let rank):
            return Card.Rank.king.rawValue * 4 + rank.rawValue
        case .FourCard(let rank):
            return Card.Rank.king.rawValue * 5 + rank.rawValue
        }
    }
}

struct PokerHand {
    static func ranking(cards: NSMutableArray) throws -> PokerHandRankings {
        guard var myCards = cards as NSArray as? [Card] else {
            throw CardGameError.ownCardNotExist
        }
        guard myCards.count != 0 else {
            throw CardGameError.ownCardNotExist
        }
        
        // sort by in descending order by rank
        myCards.sort(by: {$0.rank > $1.rank})
        
        // is it four cards?
        if findSameRank(myCards, 4).count > 0 {
            let fourCard = findSameRank(myCards, 4)
            return PokerHandRankings.FourCard(rank: fourCard[0].rank)
        }
        // is it staight?
        else if findStraight(myCards).count > 0 {
            let straight = findStraight(myCards)
            return PokerHandRankings.Straight(rank: straight[0].rank)
        }
        // is it triple?
        else if findSameRank(myCards, 3).count > 0 {
            let triple = findSameRank(myCards, 3)
            return PokerHandRankings.Triple(rank: triple[0].rank)
        }
        // are there number of pairs?
        else if findSameRank(myCards, 2).count > 0 {
            let pair = findSameRank(myCards, 2)
            
            // is it two pair?
            if pair.count >= 3 {
                return PokerHandRankings.TwoPair(rank: pair[0].rank)
            }
            // or one pair?
            else {
                return PokerHandRankings.OnePair(rank: pair[0].rank)
            }
        }
        // nothing is in own cards. return high card
        else {
            return PokerHandRankings.HighCard(rank: myCards[0].rank)
        }
    }
    
    private static let findSameRank: ([Card], Int) -> [Card] = {
        (holdCards: [Card], numberOfSameRank: Int) in
        return Array(holdCards.filter({ (card: Card) in holdCards.filter({ $0.rank == card.rank }).count >= numberOfSameRank}))
    }
    
    private static let findStraight: ([Card]) -> [Card] = {
        (holdCards: [Card]) in
        return Array(holdCards.filter({ (card: Card) in
            var point = 1;
            return holdCards.filter({
                //print("\($0) , \(card) \(decrease) ", terminator: "")
                if $0 == card {
                    //print(" -> true")
                    return true
                }
                else if $0.rank.rawValue == card.rank.rawValue - point {
                    point += 1;
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
