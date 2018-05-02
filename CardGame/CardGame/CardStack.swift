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
    private var cards: Int = 7, players: Int
    
    init(_ cards: Int,_ players: Int) {
        if cards == 2 {
            self.cards = 5
        }
        self.players = players
    }
    
    func makeCardStack(_ deck: CardDeck) -> [[Card]] {
        for _ in 0...self.players {
            var tempCard = [Card]()
            for _ in 0..<self.cards {
                tempCard.append(deck.removeOne().pick)
            }
            self.cardStack.append(tempCard)
        }
        return self.cardStack
    }
    
    func printCardStack(_ handler: (_ cards: [Card]) -> Void  ) {
        var player = 1
        for cards in self.cardStack {
            if player > self.players {
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
