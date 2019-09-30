//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let suitsPool: [PlayingCard.Suit] = [.spades, .hearts, .diamonds, .clubs]
    let ranksPool: [PlayingCard.Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    
    for _ in 1...10 {
        let card = PlayingCard(suit: suitsPool[Int.random(in: 0...3)], rank: ranksPool[Int.random(in: 0...12)])
        print(card)
    }
}

main()







