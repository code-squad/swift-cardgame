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
    private let pokerHands = PokerHands()
    func add(cards: [Card]) {
        self.cards = cards
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
    
    func sortCard() {
        self.cards.sort { $0 > $1 }
    }
    
    func handCheck() {
        if self.pokerHands.hasRoyalStraightFlush(self.cards) {
            print("로얄스트레이트플러시")
        } else if self.pokerHands.hasBackStraightFlush(self.cards) {
            print("백스트레이트플러시")
        } else if self.pokerHands.hasStraightFlush(self.cards) {
            print("스트레이트플러시")
        } else if self.pokerHands.hasFourCard(self.cards) {
            print("포카드")
        } else if self.pokerHands.hasFullHous(self.cards) {
            print("풀하우스")
        } else if self.pokerHands.hasFlush(self.cards) {
            print("플러시")
        } else if self.pokerHands.hasMountain(self.cards) {
            print("마운틴")
        } else if self.pokerHands.hasStraight(self.cards) {
            print("스트레이트")
        } else if self.pokerHands.hasTriple(self.cards) {
            print("트리플")
        } else if self.pokerHands.hasTwoPair(self.cards) {
            print("투페어")
        } else if self.pokerHands.hasOnePair(self.cards) {
            print("원페어")
        } else {
            print("탑: \(self.cards.max()!)")
        }
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
