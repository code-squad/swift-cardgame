//
//  PlayerType.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum PlayerType : CustomStringConvertible{
    case participant
    case dealer
    
    var description: String {
        switch self {
        case .participant:
            return "참가자#"
        case .dealer:
            return "딜러"
        }
    }
}
