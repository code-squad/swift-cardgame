//
//  Score2.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol CardScore: Comparable {
    var ranking: Int { get }
    var top: Card { get }
    
}
extension CardScore {
    static func < <T: CardScore> (lhs: Self, rhs: T) -> Bool {
        let higherRanking = lhs.ranking > rhs.ranking
        let higherTop = lhs.ranking == rhs.ranking && lhs.self.top > rhs.self.top
        return higherRanking || higherTop
    }
}


struct HighCard: CardScore {
    let ranking: Int = 1
    
    typealias E = Card
    var top: Card
    
    static func < <T: CardScore> (lhs: HighCard, rhs: T) -> Bool {
        let higherRanking = lhs.ranking > rhs.ranking
        let higherTop = lhs.ranking == rhs.ranking && lhs.top > rhs.top
        return higherRanking || higherTop
    }
}

struct OnePair: CardScore {
    let  ranking: Int = 2
    
    typealias E = Card
    var top: Card
    
    
}

struct TwoPair: CardScore {
    typealias E = Card
    var top: Card
    let  ranking: Int = 3
    static func < (lhs: TwoPair, rhs: TwoPair) -> Bool {
        return true
    }
}

struct Trips: CardScore {
    typealias E = Card
    var top: Card
    let  ranking: Int = 5
    static func < (lhs: Trips, rhs: Trips) -> Bool {
        return true
    }
}
