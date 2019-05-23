//
//  CardDeck.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards = [Card]()
    
    init() {
        for suit in Card.Suit.allCases {
            initSuit(suit: suit)
        }
    }
    
    /// 모양 별 초기화
    private mutating func initSuit (suit: Card.Suit) {
        for rank in Card.Rank.allCases {
            cards.append(Card(rank: rank, suit: suit))
        }
    }
    
    /// 갖고 있는 카드 개수를 반환한다.
    func count () -> Int {
        return cards.count
    }
    
    /// 기능은 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle () {
        cards = cards.shuffled()
    }
    
    /// 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne () throws -> Card {
        guard let firstCard = cards.first else { throw CardError.NotExistCard }
        
        cards.removeFirst()
        return firstCard
    }
    
    /// 처음처럼 모든 카드를 다시 채워넣는다.
    mutating func reset () {
        cards.removeAll()
        
        for suit in Card.Suit.allCases {
            initSuit(suit: suit)
        }
    }

    /// 메뉴 숫자에 따라 함수를 실행시켜준다.
    mutating func executeMenu (_ menu: Menu) throws -> Card? {
        var returnCard: Card? = nil
        switch menu {
        case .removeOne: returnCard = try removeOne()
        case .reset: reset()
        case .shuffle: shuffle()
        }
        
        return returnCard
    }
}
