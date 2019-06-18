//
//  CardScore.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 페어가 없을 경우 또는 같은 핸즈인 경우 숫자가 높은 카드를 가진 사람이 우승
/// 각각의 카드서열 가중치는 핸드값에 곱해서 기존 서열에 초과되지 않을 범위 ( highCard*14 < 2*onePair) 로 가중치를 부여함
enum CardScore : Int{
    case highCard = 1          /// A > K > Q > J > 10 >...>2
    case onePair = 20          /// 랭킹이 동일한 카드가 2장일 때. 2명 이상의 플레이어가 똑같이 원페어라면 숫자 높은 카드가 승리 K&K < A&A
    case twoPair = 200        /// 동일한 랭킹의 카드 2장이 2세트 있는 경우. 2명 이상의 플레이어가 투페어라면 가장 높은 페어를 가진 핸드가 승리
                                /// 두 번째 페어도 동일하다면 다섯 번째 카드('키커')가 높은 쪽이 승리
    case triple = 2_000        /// 가진 카드 중 세 카드 숫자가 같은 경우
    case straight = 20_000     /// 가진 카드 중 다섯 카드 숫자가 연속 번호인 경우 Ace의 경우 A,2,3,4,5 or A,K,Q,J,10 (더 높음) 이 가능
    case quads = 200_000      /// 포카드.  가진 카드 중 네 카드 숫자가 같은 경우
}
