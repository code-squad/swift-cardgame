//
//  Dealer.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Dealer: Participant {
    private let name = "딜러"
    private var cards = [Card]()
    
    var description: String {
        return "\(name) " + changeCardsToString(cards)
    }
    
    init(cards: [Card]){
        self.cards = cards
    }
    
    init(){
        
    }
}
