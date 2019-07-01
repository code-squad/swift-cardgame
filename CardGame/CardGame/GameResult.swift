//
//  GameResult.swift
//  CardGame
//
//  Created by BLU on 30/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameResult {
    case initialize(Int)
    case shuffle(Int)
    case draw(Card, Int)
}
