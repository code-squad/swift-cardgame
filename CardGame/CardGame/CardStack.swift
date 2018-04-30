//
//  CardStack.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CardStack: CardStackPrintable {

    private var cardStack = [[Card]]()
    
    func makeCardStack(_ deck: CardDeck,_ numberOfPlayer: Int,_ numberOfCard: Int) -> [[Card]] {
        
        for _ in 0...numberOfPlayer {
            var tempCard = [Card]()
            for _ in 0...numberOfCard {
                tempCard.append(deck.removeOne().pick)
            }
            self.cardStack.append(tempCard)
        }
        return self.cardStack
    }
    
    
    func printCardStack(_ numberOfPlayer: Int,_ handler: (_ cards: [Card]) -> Void  ) {
        var player = 1
        for cards in self.cardStack {
            if player > numberOfPlayer {
                print("딜러 " , terminator: "")
                handler(cards)
            } else {
                print("참가자#\(player) " , terminator: "")
                handler(cards)
                player = player+1
            }
        }
    }
    
}
