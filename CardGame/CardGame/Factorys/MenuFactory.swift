//
//  MenuFactory.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuFactory {
    
    static func create(menuNo: Int) -> Menu? {
        switch menuNo {
        case 1:
            return Reset()
        case 2:
            return Shuffle()
        case 3:
            return Draw()
        default:
            return nil
        }
    }
}
