import Foundation

struct Score: Comparable {
    
    private var cards: [Card]
    
    private(set) var matchCount: [Int : [Card.Rank]] {
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        matchCount = Dictionary(grouping: groupedByRank) { $1.count }.mapValues { $0.map { $0.key } }
        matchCount = matchCount.mapValues { $0.sorted() }
        for (cardCount, _) in matchCount {
            matchCount[cardCount]!.sort { $0 > $1 }
        }
        
    }
    
    init(cards: [Card]) {
        self.cards = cards
        
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        matchCount = Dictionary(grouping: groupedByRank) { $1.count }.mapValues { $0.map { $0.key } }
        matchCount = matchCount.mapValues { $0.sorted() }
        for (cardCount, _) in matchCount {
            matchCount[cardCount]!.sort { $0 > $1 }
        }
    }
    
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        
        
        
        
        
        
        return true
    }
}
