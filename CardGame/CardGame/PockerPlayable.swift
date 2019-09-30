//
//  PockerPlayable.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PockerPlayable: CustomStringConvertible {
    var name: String { get }
    var cards: [Card] { get }
    func updated(by cards: [Card]) -> PockerPlayable
}

extension PockerPlayable {
    var description: String {
        return "[\(cards.map { $0.description }.joined(separator: ", "))]"
    }
}
