//
//  InputReader.swift
//  CardGame
//
//  Created by RENO1 on 26/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputReader {
    static func createRandomNumberTuple() -> (Int, Int) {
        let randomShapeNumber = Int.random(in: 0 ... 100)
        let randomNumber = Int.random(in: 0 ... 100)
        return (randomShapeNumber, randomNumber)
    }
    
}
