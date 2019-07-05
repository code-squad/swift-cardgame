//
//  Hand.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Hand: Comparable, SingleValuePrintable {
    associatedtype Element: GameElement
    
    mutating func append(_ gameElement: Element)
    func showAll() -> [Element]
    func count() -> Int
}
