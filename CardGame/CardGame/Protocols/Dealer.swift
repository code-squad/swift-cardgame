//
//  Dealer.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealer where Self: Player {
    associatedtype P: Player
    
    func draw() throws -> E
}
