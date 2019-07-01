//
//  GameResult.swift
//  CardGame
//
//  Created by 이진영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameResult {
    case reset(Int)
    case shuffle(Int)
    case draw(Card, Int)
    case exit
}
