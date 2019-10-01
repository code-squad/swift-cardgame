//
//  OwnCards.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class OwnCards {
    private var cards : NSMutableArray!
    
    init() {
        cards = []
    }
    
    deinit {
        cards.removeAllObjects()
    }
    
    func add(card: Card) {
        cards.add(card)
    }
    
    func giveBackAll() {
        cards.removeAllObjects()
    }
}

extension OwnCards : CustomStringConvertible { 
    var description: String {
        var cardPrinted : String = ""
        
        for (index, cardObject) in cards.enumerated() {
            let card = cardObject as! Card
            cardPrinted += card.description
            if (index+1) % 13 == 0 {
                cardPrinted += "\n"
            }
            else {
                cardPrinted += " "
            }
        }
        
        return cardPrinted
    }
}
