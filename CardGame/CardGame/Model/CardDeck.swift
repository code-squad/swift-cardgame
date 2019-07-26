//
//  CardDeck.swift
//  CardGame
//
//  Created by JH on 12/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

///모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
struct CardDeck {
    //기본으로 모든카드를 가지고 있는 상수를 속성으로 추가해줌
    private let defaultCards: [Card]
    private var cards: [Card]
    
    init() {
        let allNumbers = CardNumber.allCases//allCases.map { "\($0)" }
        let allPatterns = CardPattern.allCases
        
        func makeCardDeck() -> [Card] {
            var cards = [Card]()
            for pattern in allPatterns {
                for number in allNumbers {
                    let card = Card.init(pattern: pattern, number: number)
                    cards.append(card)
                }
            }
            return cards
        }
        
        defaultCards = makeCardDeck()
        cards = defaultCards
    }
    
    ///count() 갖고 있는 카드 개수를 반환한다.
    func count() -> Int {
        return cards.count
    }
    
    ///shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle() {
        cards.shuffle()
    }
    
    ///removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne() -> Card? {
        guard !cards.isEmpty else {
            return nil
        }
        return cards.removeFirst()
    }
    
    ///reset() 처음처럼 모든 카드를 다시 채워넣는다.
    //사용된 속성에 모든카드를 가진 속성을 넣어주도록 함.
    mutating func reset() {
        cards = defaultCards
    }
}
