//
//  PokerPlayerFactory.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


struct PokerParticipantFactory {
    static func make(name: String) -> PokerPlayable {
        return Player(name: name) as PokerPlayable
    }
    
    static func make(name: String, cardDeck: CardDeck) -> PokerPlayable {
        return Dealer(name: name, cardDeck: cardDeck) as PokerPlayable
    }
}
