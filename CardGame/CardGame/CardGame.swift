//
//  CardGame.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private(set) var cardDeck: CardDeck
    
    init(_ cardDeck: CardDeck) {
        self.cardDeck = cardDeck
    }
    
    enum Action: Int {
        case reset = 1, shuffle, selectOne
    }
    
    enum GameError: String, Error {
        case invalidSelection = "잘못된 게임 메뉴입니다. 다시 선택하세요."
        case emptyValue = "입력값이 없습니다."
    }
    
    mutating func startGame(_ action: Action) -> Card? {
        switch action {
        case .reset:
            self.cardDeck.reset()
        case .shuffle:
            self.cardDeck.suffle()
        case .selectOne:
            return self.cardDeck.removeOne()
        }
        
        return nil
    }
}
