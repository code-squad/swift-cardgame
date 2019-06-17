//
//  GamePlayer.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class GamePlayer{
    private var myCardDeck : [Card]
    private (set) var name: String
    
    init(_ name: String = "참가자"){
        self.name = name
        myCardDeck = [Card]()
    }
    
    func addMyCard(_ card: Card){
        myCardDeck.append(card)
    }
    func getMyDeck() -> [Card]{
        return myCardDeck
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation (_ target: GamePlayer){
        let description = target.getMyDeck().map{ $0.description }.joined(separator: ", ")
        appendLiteral(target.name)
        appendLiteral(" [")
        appendLiteral(description)
        appendLiteral("]")
    }
}
