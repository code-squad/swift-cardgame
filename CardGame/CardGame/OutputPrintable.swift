//
//  OutputPrintable.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol OutputPrintable {
    func reset() -> [Card]
    func shuffle() -> [Card]
    func removeOne() -> (basic: [Card], pick: Card)
}
