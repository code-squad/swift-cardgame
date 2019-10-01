//
//  PokerPlayable.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


protocol PokerPlayable {
    var ownCards : OwnCards! { get }
    var name : String! { get }
    
    func addCard(card: Card)
    func myOwnCard() -> OwnCards
    func giveBackCardAll()
}
