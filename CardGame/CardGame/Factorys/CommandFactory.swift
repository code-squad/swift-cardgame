//
//  MenuFactory.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CommandFactory<D: Deck>: Factory {
    typealias IN = (menuNo: Int, deck: D)
    typealias OUT = Command
    
    static func create(_ input: (menuNo: Int, deck: D)) -> Command? {
        var command: Command?
        
        switch input.menuNo {
        case 1:
            command = createReset(deck: input.deck)
        case 2:
            command = createShuffle(deck: input.deck)
        case 3:
            command = createDraw(deck: input.deck)
        default:
            ()
        }
        return command
    }
    
    private static func createReset(deck: D) -> Reset<D> {
        return Reset(deck: deck)
    }
    private static func createShuffle(deck: D) -> Shuffle<D> {
        return Shuffle(deck: deck)
    }
    private static func createDraw(deck: D) -> Draw<D> {
        return Draw(deck: deck)
    }
    
}
