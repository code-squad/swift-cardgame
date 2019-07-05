//
//  Entry.swift
//  CardGame
//
//  Created by 이동영 on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Entry {
    associatedtype P: Player
    
    var count: Int { get }
    
    func draw(numOfCard: Int, completion: @escaping () -> (Void)) throws
    func win() -> P
    mutating func reset()
    
}
