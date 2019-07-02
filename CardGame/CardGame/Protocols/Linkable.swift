//
//  Linkable.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Linkable where Self: GameElement {
    typealias E = Self
    
    func isLink(with: E) -> Bool
}
