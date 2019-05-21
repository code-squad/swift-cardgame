//
//  main.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func main() {
    let card = Card(rank: Card.Rank.seven, suit: Card.Suit.spades)
    
    print(card.description)
}

main()
