//
//  CardGameParticipant.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardGameParticipant: Int {
    case one = 1
    case two
    case three
    case four
    
    init?(selectNumber: String) {
        let participantSelection = Int(selectNumber) ?? 0
        guard let cardGameParticipant = CardGameParticipant(rawValue: participantSelection) else {
            return nil
        }
        self = cardGameParticipant
    }
    
    var count: Int {
        return self.rawValue
    }
}
