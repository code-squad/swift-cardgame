//
//  GamePlayer.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol GamePlayer {
    func getName(with number: Int) -> String
    func take(card: Card)
    func showCards() -> String
    func resetCards()
    var bestHand: Hand? { get }
}
