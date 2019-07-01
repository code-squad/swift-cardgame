//
//  GameResult.swift
//  CardGame
//
//  Created by 이동영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CommandResult: Equatable {
    case reset(remain: Int)
    case shuffle(remain: Int)
    case draw(card: Card?, remain: Int)
    case count(remain: Int)
}
