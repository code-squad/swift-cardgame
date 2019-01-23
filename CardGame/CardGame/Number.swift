//
//  Number.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//enum을 만들고 스위프트에게 allCases 배열을 자동으로 만들어달라고 하는 구조
enum Number: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    var value: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return "\(self.rawValue)"
        }
    }
}
