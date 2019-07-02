//
//  Pairable.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Pairable where Self: GameElement {
    associatedtype E = Self
    
    func isPair(with : E) -> Bool
}
