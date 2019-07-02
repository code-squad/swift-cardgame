//
//  NumberOfParticipants.swift
//  CardGame
//
//  Created by Daheen Lee on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum NumberOfParticipants: Int {
    case one = 1, two, three, four
    
    init?(number: String) {
        let convertedNumber = Int(number) ?? 0
        guard let numberOfParticipants = NumberOfParticipants(rawValue: convertedNumber) else {
            return nil
        }
        self = numberOfParticipants
    }
    
    var count: Int {
        return self.rawValue
    }
}

