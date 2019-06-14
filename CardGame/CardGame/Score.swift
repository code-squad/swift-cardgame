import Foundation

struct Score: Comparable {
    
    var matchCount: [Int : [Card.Rank]]
    
    init(cards: [Card]) {
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        matchCount = Dictionary(grouping: groupedByRank) { $1.count }.mapValues { $0.map { $0.key } }
        for (cardCount, _) in matchCount {
            matchCount[cardCount]!.sort()
        }
    }
    
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        for cardCount in 1...4 {
            
        }
        
    }
}
