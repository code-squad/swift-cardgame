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
    
    var count: Int {
        return deck.count
    }
    
    mutating func shuffle() {
        deck.shuffle()
    }
    
    mutating func drawCard() -> Card? {
        guard !deck.isEmpty else { return nil }
        return deck.removeFirst()
    }
    
    mutating func drawCards(count: Int) -> [Card]? {
        guard deck.count >= count else { return nil }
        var cards = [Card]()
        for _ in 1...count {
            cards.append(drawCard()!)
        }
        return cards
    }
    
    mutating func reset() {
        deck = defaultDeck
    }
}
