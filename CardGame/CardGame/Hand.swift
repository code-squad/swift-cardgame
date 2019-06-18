import Foundation

class Hand {
    
    private var cards = [Card]()
    
    var score: Score {
        return Score(cards: cards)
    }
    
    func addCard(_ card: Card) {
        cards.append(card)
    }
    
    func addCards(_ cards: [Card]) {
        for card in cards {
            self.cards.append(card)
        }
    }
    
    func reset() {
        cards.removeAll()
    }
}
