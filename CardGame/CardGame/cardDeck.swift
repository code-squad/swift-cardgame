//
//  cardDeck.swift
//  CardGame
//
//  Created by Elena on 24/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol CardGameSet{
    func count() -> Int
    mutating func shuffle()
    mutating func removeOne() -> Card
    mutating func reset()
}

struct CardDeck: CardGameSet{

    private var cards: [Card] = []
    
    init() {
        reset()
    }
    
    // 갖고 있는 카드 개수를 반환
    func count() -> Int {
        return cards.count
    }
    // 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle() {
        cards.shuffle()
    }
    // 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne() -> Card {
        return cards.removeFirst()
    }
    // 처음처럼 모든 카드를 다시 채워 넣는다.
    mutating func reset() {
        cards.removeAll()
        addAllFiller()
        shuffle()
    }
    
    // 전체 채우기
    private mutating func addAllFiller() {
        for shape in Shape.allCases {
            for number in Number.allCases {
                self.cards.append(Card(number: number, shape: shape))
            }
        }
    }
    
    // 카드가 비어있는지 확인하기 위해 만듬.
    var isEmpty: Bool {
        return cards.isEmpty
    }
    
    // 역할 : 메뉴선택에 따라 출력결과를 다르게 반환
    // 매개변수 : Menu , 반환형 : String
    mutating func getResult(_ menu: Menu) -> String {
        switch menu {
        case .reset:
            reset()
            return "카드 전체를 초기화했습니다.\n총 \(self.count())장의 카드가 남아있습니다. \n"
        case .shuffle:
            shuffle()
            return "전체 \(self.count())장의 카드를 섞었습니다. \n"
        case .pullOut:
            let card = removeOne()
            return "\(card)\n총 \(self.count())장의 카드가 남아있습니다. \n"
        case .quit:
            return "종료"
        }
    }
   
}
