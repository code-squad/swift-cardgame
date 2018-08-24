//
//  CardAction.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Action : String {
    case reset = "1"
    case shuffle = "2"
    case removeOne = "3"
    
    func execute() throws {
        switch self {
        case .reset:
            CardDeck.reset()
            let action = "카드 전체를 초기화했습니다."
            let count = CardDeck.count()
            let countAction = "장의 카드가 있습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        case .shuffle:
            CardDeck.shuffle()
            let action = ""
            let count = CardDeck.count()
            let countAction = "장의 카드를 섞었습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        case .removeOne:
            guard let removeCard = CardDeck.removeOne() else { throw CardError.noCardsRemaining }
            let action = "\(removeCard)"
            let count = CardDeck.count()
            let countAction = "장의 카드가 남아있습니다."
            OutputView.printCard(action: action, count: count, countAction: countAction)
        }
    }
}
