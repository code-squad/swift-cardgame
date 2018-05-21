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
    
    var bestHand: PokerHands.Hand {
        let pokerHands = PokerHands(self.cards)
        return pokerHands.selectBestHand(pokerHands.generateHands())
    }
    
    func add(cards: [Card]) {
        self.cards = cards
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
    
    func sortCard() {
        self.cards.sort { $0 > $1 }
    }
    
    func selectWinner(_ player: GamePlayer) -> GamePlayer {
        return self < player ? player : self
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

extension GamePlayer: Comparable {
    static func < (lhs: GamePlayer, rhs: GamePlayer) -> Bool {
        return lhs.bestHand < rhs.bestHand
    }
    
    static func == (lhs: GamePlayer, rhs: GamePlayer) -> Bool {
        return lhs.bestHand == rhs.bestHand
    }
}
