//
//  GamePlayer
//
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


class GamePlayer {
    private var cards: [Card] = [Card]()
    
    func add(cards: [Card]){
        self.cards = cards
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
}

extension GamePlayer: CustomStringConvertible {
    var description: String {
        var result: String = "["
        for card in self.cards {
            result += "\(card) ,"
        }
        result.removeLast(2)
        return result + "]"
    }
}
