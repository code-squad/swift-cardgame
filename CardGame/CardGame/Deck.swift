import Foundation

typealias Deck = [Card]

private let initialDeck: [Card] = {
    var temporaryDeck = [Card]()
    for suit in Card.Suit.allCases {
        for rank in Card.Rank.allCases {
            temporaryDeck.append(Card(rank: rank, suit: suit))
        }
    }
    return temporaryDeck
}()

extension Deck {
    
    init() {
        self = initialDeck
    }
    
    mutating func drawCard() -> Card? {
        guard !self.isEmpty else { return nil }
        return self.removeFirst()
    }
    
    mutating func resetDeck() { self = initialDeck }
}
