//
//  OutputView.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printCard(card: Card) {
        print("\(card.suitDescribe())\(card.rankDescribe())")
    }
}
