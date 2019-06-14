import Foundation

struct Score: Comparable {
    
    private(set) var matchCount: [Int : [Card.Rank]]
    
    init(cards: [Card]) {
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        matchCount = Dictionary(grouping: groupedByRank) { $1.count }.mapValues { $0.map { $0.key } }
        for (cardCount, _) in matchCount {
            matchCount[cardCount]!.sort { $0 > $1 }
        }
    }
    
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        
        
        
        
        
    }
}
