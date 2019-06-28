//
//  Player.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    func showDown<H: Hand>() -> H
    func receive <E: GameElement>(_: E)
}
