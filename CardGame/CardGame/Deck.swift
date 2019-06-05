import Foundation

struct Deck {
    
    private let defaultDeck: [Card] = {
        var temporaryDeck = [Card]()
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                temporaryDeck.append(Card(rank: rank, suit: suit))
            }
        }
        return temporaryDeck
    }()
    
    private var deck: [Card]
    
    init() {
        deck = defaultDeck
    }
    
    var count: Int { return deck.count }
    
    mutating func shuffle() { deck.shuffle() }
    
    mutating func drawCard() -> Card? {
        guard !deck.isEmpty else { return nil }
        return deck.removeFirst()
    }
    
    mutating func reset() { deck = defaultDeck }
    
}
