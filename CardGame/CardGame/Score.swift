import Foundation

enum PokerHand: Comparable {
    
    case highCard(Card.Rank)
    case onePair(Card.Rank)
    case twoPair(Card.Rank)
    case threeOfAKind(Card.Rank)
    case straight(Card.Rank)
    case fourOfAKind(Card.Rank)
    
    static func < (lhs: PokerHand, rhs: PokerHand) -> Bool {
        if lhs.score == rhs.score {
            return lhs.rank < rhs.rank
        }
        return lhs.score < rhs.score
    }
    
    var rank: Card.Rank {
        switch self {
        case .highCard(let rank): return rank
        case .onePair(let rank): return rank
        case .twoPair(let rank): return rank
        case .threeOfAKind(let rank): return rank
        case .straight(let rank): return rank
        case .fourOfAKind(let rank): return rank
        }
    }
    
    var score: Int {
        switch self {
        case .highCard(_): return 1
        case .onePair(_): return 2
        case .twoPair(_): return 3
        case .threeOfAKind(_): return 4
        case .straight(_): return 5
        case .fourOfAKind(_): return 6
        }
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
