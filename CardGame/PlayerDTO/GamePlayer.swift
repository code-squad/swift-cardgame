//
//  GamePlayer.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class GamePlayer {
    private (set) var myHand : Hand = Hand()
    private (set) var name: String
    var priority : Int {
        get {
            return myHand.calculateEachPlayerHand()
        }
    }
    init(_ name: String = "참가자"){
        self.name = name
    }
    
    func addHand (_ hand: Hand){
        myHand = hand
    }

    func receivePrintFormat(_ output: (String, Hand) -> Void){
        output(name, myHand)
    }
    
    func sortDeck(){
        myHand.sortOwnDeck()
    }
}
