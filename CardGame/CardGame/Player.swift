//
//  Player.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var cards: [Card] { get }
    func getName() -> String
}

extension Player {
    /// 카드 배열을 출력하기 위한 함수
    mutating func cardToPrint() -> String {
        var cardForPrint: String = "["
        for card in cards {
            cardForPrint += "\(card.suit.suit)\(card.rank.description),"
        }
        cardForPrint.removeLast()
        cardForPrint += "]"
        return cardForPrint
    }
}
