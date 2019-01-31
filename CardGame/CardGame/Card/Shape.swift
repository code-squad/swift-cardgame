//
//  Shape.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//enum을 만들고 스위프트에게 allCases 배열을 자동으로 만들어달라고 하는 구조
enum Shape: Character, CaseIterable {
    case spades = "♠️", heart = "♥️", diamond = "♦️", club = "♣️"
}
