//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let firstCard: Card = Card(suit: .hearts, number: .queen)
    let secondCard: Card = Card(suit: .spades, number: .seven)
    
    OutputView.printCard(firstCard)
    OutputView.printCard(secondCard)
}

main()
