//
//  CardGame.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CardGame {
    private let numberOfCardStacks: Int = 7
    var cardDeck: CardDeck
    var cardStacks: [CardStack]  // 이 부분도 Array의 속성을 갖고 있으니 [CardStack]을 객체로 표현하는게 좋을까요?
    
    init() {
        self.cardDeck = CardDeck()
        self.cardStacks = [CardStack](repeating: CardStack(), count: self.numberOfCardStacks)
    }
}
