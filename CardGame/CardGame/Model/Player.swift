//
//  Player.swift
//  CardGame
//
//  Created by JH on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Player {
    
    var hand = [Card]()
    
    //패에 카드를 추가함.플레이어가 가지고 있는 카드배열에 딜러가 주는 카드를 넣어주는 메소드
    mutating func addCard(card: Card) {
        hand.append(card)
    }
    
    mutating func resetHands() {
        hand.removeAll()
    }
    
}
