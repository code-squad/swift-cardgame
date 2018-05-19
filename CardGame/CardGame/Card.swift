//
//  CardGame.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

// 카드를 생성하는 객체
class Card {

    // suits : 모양을 저장하는 변수
    // rnak  : 숫자를 저장하는 변수
    
    let suits: Suits
    let rank: Rank
    
    init(_ suits: Suits, _ rank: Rank) {
        self.suits = suits
        self.rank = rank
    }
    
    // 생성 된 카드를 출력하는 함수
    func desription() -> String {
        return "\(suits.rawValue) \(rank.description)"
    }
}
