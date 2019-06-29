//
//  etc.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func loop(times: Int, f: () throws -> Void) throws {
    for _ in 0..<times{
        try f()
    }
}

prefix func ++ (number: inout Int) -> Int {
    number+=1
    return number
}
