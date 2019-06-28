//
//  MyPlayer.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MyPlayer: Player {
    typealias H = CardHand
    typealias E = Card
    
    private let name: String
    private var hand: CardHand = CardHand()

    var description: String {
        return "\(name)\(hand.showAll())"
    }
    
    init(name: String = "참가자" ) {
        self.name = name
    }
    
     func showDown() -> CardHand {
        return self.hand
    }
    
    func receive(_ gameElement: Card) {
        hand.append(gameElement)
    }

}
