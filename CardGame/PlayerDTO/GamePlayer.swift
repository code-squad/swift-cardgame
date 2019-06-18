//
//  GamePlayer.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class GamePlayer: CustomStringConvertible{

    private (set) var myCardDeck : [Card]
    private (set) var name: String
    
    init(_ name: String = "참가자"){
        self.name = name
        myCardDeck = [Card]()
    }
    
    func addMyCard(_ card: Card){
        myCardDeck.append(card)
    }

    func sortMyDeck() {
        self.myCardDeck.sort(by: { (card1, card2) in
            return card1.number.rawValue <= card2.number.rawValue
        })
    }

    var description : String {
        return "\(name) \(myCardDeck)"
    }
    
    func receivePrintFormat(_ output: (String, [Card]) -> Void){
        output(name, myCardDeck)
    }
}
