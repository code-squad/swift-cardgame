//
//  Setting.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Setting {
    let mode: Mode
    let entry: Entry
    
    enum Mode: Int {
        case seven = 1
        case five
        
        var numOfCard: Int {
            switch self {
            case .seven:
                return 7
            case .five:
                return 5
            }
        }
    }
    
    enum Entry: Int {
        case one = 1
        case two
        case three
        case four
        
        var numOfPlayer: Int {
            return rawValue
        }
    }
    
    init?(mode: Int, entry: Int) {
        guard let mode = Mode(rawValue: mode), let entry = Entry(rawValue: entry) else {
            return nil
        }
        self.mode = mode
        self.entry = entry
    }
    
}
