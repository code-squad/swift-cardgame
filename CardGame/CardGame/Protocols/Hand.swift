//
//  Hand.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Hand {
    associatedtype Element: GameElement
    
    func showAll() -> [Element]
}
