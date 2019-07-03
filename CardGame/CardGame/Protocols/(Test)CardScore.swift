//
//  Score2.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//==========================================================
//  이런 형태로의 구현은 어떤지 궁금하여서 파일로 남겨보겠습니다.
//  프로토콜로 구현하니 구현타입끼리의 비교를 위해선
//  특정 데이터들이 public 해야 해서 프로토콜보다는
//  private 할수 있는 열거형(Enums/Score.swift)으로 구현했습니다.
//  타입이 지속적으로 추가될수 있는 관점에서 프로토콜도 좋은 해답일 줄 알았는데
//  개선할 방법이 있다면 개선하고 싶어서 남깁니다.
//===========================================================
protocol CardScore: Comparable {
    var ranking: Double { get }
    // 수와 수 사이에 무한한 갯수의 수가 존재하여 삽입이 쉬울거라고 판단하여서 Double로 구현
    var top: Card { get }
}
extension CardScore {
    static func < <T: CardScore> (lhs: Self, rhs: T) -> Bool {
        let higherRanking = lhs.ranking > rhs.ranking
        let higherTop = lhs.ranking == rhs.ranking && lhs.top > rhs.top
        return higherRanking || higherTop
    }
}

struct HighCard: CardScore {
    typealias E = Card
    
    let ranking: Double = 1
    var top: Card
}

struct OnePair: CardScore {
    typealias E = Card
    
    let ranking: Double = 2
    var top: Card
}

struct TwoPair: CardScore {
    typealias E = Card
    
    let  ranking: Double = 3
    var top: Card
}

struct Trips: CardScore {
    typealias E = Card
    
    let ranking: Double = 5
    var top: Card
}

struct Stright: CardScore {
    typealias E = Card
    
    let ranking: Double = 6
    var top: Card
}

struct FourCard: CardScore {
    typealias E = Card
    
    let ranking: Double = 7
    var top: Card
}
