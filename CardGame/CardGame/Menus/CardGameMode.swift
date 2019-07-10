//
//  CardGameMode.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//GameMode
enum CardGameMode: Int {
    case sevenCard = 1
    case fiveCard
    
    init?(selectMode: String) {
        let gameSelection = Int(selectMode) ?? 0
        guard let menu = CardGameMode(rawValue: gameSelection) else {
            return nil
        }
        self = menu
    }
    
    var numberOfCards: Int {
        switch self {
        case .sevenCard:
            return 7
        case .fiveCard:
            return 5
        }
    }
}

