//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

OutputView.printCard(card: Card(suit: Suit(rawValue: Int.random(in: 0...3))!,
                                rank: Rank(rawValue: Int.random(in: 1...13))!))


