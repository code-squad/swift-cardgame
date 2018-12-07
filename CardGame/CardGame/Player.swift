//
//  Player.swift
//  CardGame
//
//  Created by 윤동민 on 07/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Player {
    private(set) var cards : [Card]
    
    init() {
        cards = []
    }
    
    // 카드 패를 받음
    func receiveCards(_ cards: [Card]) {
        self.cards = cards
    }
}
