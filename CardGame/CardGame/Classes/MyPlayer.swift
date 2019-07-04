//
//  MyPlayer.swift
//  CardGame
//
//  Created by 이동영 on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MyPlayer: Player {
    typealias H = CardHand
    typealias E = Card
    
    private let name: String
    private var hand: CardHand
    
    init(name: String = "참가자", hand: CardHand = CardHand() ) {
        self.name = name
        self.hand = hand
    }
    
    func receive(_ gameElement: Card) {
        hand.append(gameElement)
    }
    
    func clearHand() {
        self.hand.clear()
    }
    
}
// - MARK: - Comparable
extension MyPlayer: Comparable {
    
    static func == (lhs: MyPlayer, rhs: MyPlayer) -> Bool {
        return lhs.hand == rhs.hand
    }
    
    static func < (lhs: MyPlayer, rhs: MyPlayer) -> Bool {
        return lhs.hand < rhs.hand
    }
    
}
// - MARK: - Printable
extension MyPlayer: Printable {
    
    func print(logic: @escaping (String) -> Void) {
        self.hand.print(logic: { logic("\(self.name)\t\($0)") })
    }
    
}
