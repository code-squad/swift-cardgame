//
//  Player.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player where Self: CustomStringConvertible {
    associatedtype H: Hand
    associatedtype E: GameElement
    
    func showDown() -> H
    func receive(_ gameElement: E)
}
