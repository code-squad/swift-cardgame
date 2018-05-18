//
//  PokerHands.swift
//  CardGame
//
//  Created by moon on 2018. 5. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PokerHands {

    /// 로열 스트레이트 플러시
    func hasRoyalStraightFlush(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 모양 5개가 있는지 확인
        for suit in Card.Suit.allCases {
            // 같은 모양의 카드를 모아두는 배열
            var sameSuitCards: [Card] = [Card]()
            for card in cards {
                if card.isSameSuit(suit) {
                    sameSuitCards.append(card)
                }
            }
            // 같은 모양의 카드가 A, K, Q, J, 10가 있는지 확인
            if sameSuitCards.count >= 5 {
                if sameSuitCards[0].isSameNumber(.ace) &&
                    sameSuitCards[1].isSameNumber(.king) &&
                    sameSuitCards[2].isSameNumber(.queen) &&
                    sameSuitCards[3].isSameNumber(.jack) &&
                    sameSuitCards[4].isSameNumber(.ten) {
                    result = true
                }
            }
        }
        return result
    }
    
    /// 백스트레이트 플러시
    
    /// 스트레이트 플러시
    
    // 포카드
    
    // 풀하우스
    
    // 플러시
    
    // 마운틴
    
    // 백스트레이트
    
    // 스트레이트
    
    // 트리플
    
    // 투페어
    
    // 원페어
    
    // 탑(하이카드)
    
}
