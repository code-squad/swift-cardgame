//
//  Dealable.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealable: Player {
    func give() -> Card?
    func reset()
}
