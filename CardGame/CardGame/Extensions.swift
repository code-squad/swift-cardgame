//
//  Extensions.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 30..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension Array {

    mutating func shuffle() {
        var count: UInt32 = UInt32(self.count)
        for (index, value) in self.reversed().enumerated() {
            defer { count -= 1 }
            let random = Int(arc4random_uniform(count))
            self.swapAt(index, random)
        }
    }

}
