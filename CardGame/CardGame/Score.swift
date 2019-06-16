import Foundation

struct Score: Comparable {
    
    private var cards: [Card]
    private var matchCount: [Int: [Card.Rank]] {
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        let groupedByCount = Dictionary(grouping: groupedByRank) { $1.count }
        let matchInfo = groupedByCount.mapValues { $0.map { $0.key } }
        return matchInfo.mapValues { $0.sorted { $0 > $1 } }
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        
        // 4카드를 확인합니다.
        if var lhs = lhs.matchCount[4],
            var rhs = rhs.matchCount[4] {
            while !(lhs.isEmpty || rhs.isEmpty) {
                if lhs.removeFirst() < rhs.removeFirst() {
                    return true
                }
                return false
            }
        } else if lhs.matchCount[4] == nil,
            rhs.matchCount[4] != nil {
            return true
        } else if lhs.matchCount[4] != nil,
            rhs.matchCount[4] == nil {
            return false
        }
        
        
        
        return true
    }
}
