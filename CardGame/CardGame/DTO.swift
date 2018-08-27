//
//  DTO.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Player {
    var cards = [Card]()
}

struct Players {
    var player = [Player]()
}

struct Dealer {
    var cards = [Card]()
}

struct CardsWithPerson {
    var players : String
    var cards : [Card]
}
