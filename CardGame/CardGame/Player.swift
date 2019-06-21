//
//  Player.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var cards: [Card] { get }
    func getName() -> String
}

