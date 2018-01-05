//
//  HandType.swift
//  CardGame
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import Foundation

enum HandType: Int {
    case highCard = 0
    case pair           // 숫자가 같은 카드 2장
    case twoPair        // 원 페어가 2쌍 존재
    case threeOfKind    // 숫자가 같은 카드 3장
    case straight       // 숫자가 연속된 카드 5장
    case flush          // 숫자 상관없이 무늬가 같은 카드 5장
    case fullHouse      // 트리플과 원 페어가 같이 존재
    case fourOfKind     // 숫자가 같은 카드 4장
    case straightFlush  // 숫자가 연속되고 무늬가 같은 카드 5장
}
