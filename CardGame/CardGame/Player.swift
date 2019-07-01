//
//  Player.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var cards: [Card] { get set }
    var playerDescription: String { get }
}
