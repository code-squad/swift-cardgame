//
//  GameOutputView.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func show<P: Player>(players: [P]) {
        players.forEach {
            output(target: $0)
        }
    }
    
    static func output<T> (target: T) {
        print(target)
    }
}
