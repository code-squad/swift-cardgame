//
//  GameResult.swift
//  CardGame
//
//  Created by 이동영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameResult {
    case reset(remain: CardDeck)
    case shuffle(remain: CardDeck)
    case draw(card:Card?,remain: CardDeck)
}
