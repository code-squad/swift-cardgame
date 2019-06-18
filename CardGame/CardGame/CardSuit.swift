//
//  CardSuit.swift
//  CardGame
//
//  Created by jang gukjin on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// enum을 선택한 이유: 다양한 속성 중 특정한 속성 하나를 뽑기 편한것 같아서
enum CardSuit: CaseIterable {
    case diamond, heart, clover, spade
    
    var suit: String {
        switch self {
        case .diamond : return "♦️" //"\u{2666}\u{fe0f}"
        case .heart : return "♥️" //"\u{2665}\u{fe0f}"
        case .clover : return "♣️" //"\u{2663}\u{fe0f}"
        case .spade : return "♠️" //"\u{2660}\u{fe0f}"

        }
    }
}
