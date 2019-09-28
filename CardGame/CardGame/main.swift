//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func main() {
    
    let randomSuit = Suit(rawValue: Int.random(in: 1...4)) ?? Suit.spade
    let randomRank = Rank(rawValue: Int.random(in: 1...13)) ?? Rank.one
    let card = Card(suit: randomSuit, rank: randomRank)
    print(card.description)
}


main()
