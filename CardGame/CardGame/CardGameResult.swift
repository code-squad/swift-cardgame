//
//  CardGameResult.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardGameResult {    
    case reset(Int)
    case shuffle(Int)
    case pick(Card, Int)
    case stack([CardStack])
    case players(Players)
}
