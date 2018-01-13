//
//  File.swift
//  CardGame
//
//  Created by jack on 2018. 1. 13..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct HandsRater {
    
    var stacksOfPlayers : [[Card]] = []
    var handsOfPlayers : [Hand] = []
    
    init(_ userStacks : [[Card]]) {
        self.stacksOfPlayers = userStacks
        for indexOfStack in 0..<userStacks.count {
            self.handsOfPlayers.append(Hand.init(userStacks[indexOfStack]))
        }
    }
    
    func compareHands() {
        
    }
    
}
