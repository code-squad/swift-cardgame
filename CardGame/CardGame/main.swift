//
//  main.swift
//  CardGame
//
//  Created by Jack
//  2018/01/05
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let oneSuit = Card.Suits.heart
let oneRank = Card.Ranks.twelve

let oneCard = Card(oneSuit, oneRank)
print(oneCard.generateOneCard())

