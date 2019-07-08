//
//  NumberOfPlayer.swift
//  CardGame
//
//  Created by 이진영 on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum NumberOfPlayer: Int {
    case invalidValue = 0, one, two, three, four
    
    init(_ number: Int) {
        self = NumberOfPlayer(rawValue: number) ?? .invalidValue
    }
}
