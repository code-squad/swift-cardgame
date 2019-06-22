//
//  CardConsequence.swift
//  CardGame
//
//  Created by jang gukjin on 22/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardConsequence: Int {
    case noScore = 0
    case onePare = 1
    case twoPare, triple, straight, fourCard
    
    var result: Int {
        return self.rawValue
    }
}
