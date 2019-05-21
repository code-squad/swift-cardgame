//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let card = Card(rank: Card.Rank.seven, suit: Card.Suit.spades)
    
    print(card.description)
}

main()
