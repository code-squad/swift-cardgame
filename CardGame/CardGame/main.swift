//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    
    static func main(){
        let heartJack = Card(type: CardType.heart, number: CardNumber.jack)
        print("\(heartJack)")
        let cloverQueen = Card(type: CardType.clover, number: CardNumber.queen)
        print("\(cloverQueen)")
        let diamondKing = Card(type: CardType.diamond, number: CardNumber.king)
        print("\(diamondKing)")
        let spadeAce = Card(type: CardType.spade, number: CardNumber.ace)
        print("\(spadeAce)")
    }
}

Main.main()
