//
//  Participant.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Participant: Player {
    let number: Int
    
    init(number: Int) {
        self.number = number
        super.init()
    }
    
    override var description: String {
        return "참가자#\(self.number) \(super.description)"
    }
    
}
