//
//  GameMenu.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenu : CustomStringConvertible{

    case initialization
    case shuffle
    case drawOne
    
    init (_ number : Int) throws {
        switch number {
        case 1:
            self = .initialization
        case 2:
            self = .shuffle
        case 3:
            self = .drawOne
        default:
            throw GameMenuError.outOfRange
        }
    }
    var description: String {
        switch self {
        case .initialization:
            return "1. 카드 초기화"
        case .shuffle:
            return "2. 카드 섞기"
        case .drawOne:
            return "3. 카드 하나 뽑기"
        }
    }
    
    func getResultMessage( cardDeck: CardDeck) -> String{
        switch self {
        case .initialization:
            return "카드 전체를 초기화했습니다.\n총 \(cardDeck.deckSize)장의 카드가 있습니다."
        case .shuffle:
            return "전체 \(cardDeck.deckSize)장의 카드를 섞었습니다."
        case .drawOne:
            return "총 \(cardDeck.deckSize)장의 카드가 남아있습니다."
        }
    }
}
