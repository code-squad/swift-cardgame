//
//  CardGameResult.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandlingDeckResult {
    case reset(Int)
    case shuffle(Int)
    case draw(Card?, Int)
}
