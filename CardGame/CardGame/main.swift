//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    let shape = Shape.spades
    let number = Number.king
    let testCard = Card(shape, number)
    print(testCard.description)
}

main()
