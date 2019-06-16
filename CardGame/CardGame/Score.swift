import Foundation

enum PokerHand: Int, Comparable {
    
    case highCard
    case onePair
    case twoPair
    case threeOfAKind
    case straight
    case fourOfAKind
    
    static func < (lhs: PokerHand, rhs: PokerHand) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

struct Score: Comparable {
    
    
    
    
    
    private var cards: [Card]
    private var matchedRanks: [Int: [Card.Rank]] {
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        let groupedByCount = Dictionary(grouping: groupedByRank) { $1.count }
        let matchInfo = groupedByCount.mapValues { $0.map { $0.key } }
        return matchInfo.mapValues { $0.sorted { $0 > $1 } }
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        
        func compare(matchCount: Int) -> Bool? {
            if var lhs = lhs.matchedRanks[matchCount],
                var rhs = rhs.matchedRanks[matchCount] {
                while !(lhs.isEmpty || rhs.isEmpty) {
                    if lhs.removeFirst() < rhs.removeFirst() {
                        return true
                    }
                }
                return false
            } else if lhs.matchedRanks[matchCount] == nil,
                rhs.matchedRanks[matchCount] != nil {
                return true
            } else if lhs.matchedRanks[matchCount] != nil,
                rhs.matchedRanks[matchCount] == nil {
                return false
            }
            return nil
        }
        
        // 포카드를 확인합니다.
        if let fourOfAKind = compare(matchCount: 4) {
            return fourOfAKind
        }
        
        // 스트레이트를 확인합니다.
        
        
        // 트리플을 확인합니다.
        if let threeOfAKind = compare(matchCount: 3) {
            return threeOfAKind
        }
        
        // 투페어를 확인합니다.
        
        
        // 원페어를 확인합니다.
        
        
        
        return true
    }
}
