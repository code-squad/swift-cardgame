//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    guard let card = Card(suit: "spade", rank: 12) else {
        return
    }
    
    print(card)
}

main()
