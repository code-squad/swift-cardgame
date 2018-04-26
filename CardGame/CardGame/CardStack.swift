//
//  CardStack.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CardStack {

    func makeCardStack(_ deck: CardDeck) -> [[Card]] {
        var cardStack = [[Card]]()
        let stack = 6
        
        for index in 0...stack {
            var tempCard = [Card]()
            for _ in 0...index {
                tempCard.append(deck.removeOne().pick)
            }
            cardStack.append(tempCard)
        }
        return cardStack
    }

}
