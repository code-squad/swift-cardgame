//
//  Player.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var name: String { get }
    var hand: Hand { get }
    mutating func receive(newCards: Card)
}
