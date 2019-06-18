import Foundation

class Hand: CustomStringConvertible {
    
    private var cards = [Card]()
    
    var description: String {
        return "\(cards)"
    }
    
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
