import Foundation

enum PokerHand: Comparable {
    
    case highCard([Card])
    case onePair([Card])
    case twoPair([Card])
    case threeOfAKind([Card])
    case straight([Card])
    case fourOfAKind([Card])
    
    init(cards: [Card]) {
        
        let sortedCards = cards.sorted { $0.rank > $1.rank }
        
        let groupedByRank = Dictionary(grouping: cards, by: { $0.rank })
        let groupedByCount = Dictionary(grouping: groupedByRank, by: { $1.count })
        
        //MARK: PokerHand 분석
        func isFourOfAKind() -> Bool {
            if groupedByCount[4] != nil { return true }
            return false
        }
        
        func isStraight() -> Bool {
            var straightCount = 0
            
            for index in 0..<sortedCards.count - 1 {
                if sortedCards[index].rank.rawValue == sortedCards[index].rank.rawValue - 1 {
                    straightCount += 1
                } else if sortedCards[index].rank.rawValue == sortedCards[index].rank.rawValue {
                    
                } else {
                    straightCount = 0
                }
            }
            return straightCount >= 5
        }
        
        func isThreeOfAKind() -> Bool {
            if groupedByCount[3] != nil { return true }
            return false
        }
        
        func isTwoPair() -> Bool {
            if let ranks = groupedByCount[2], ranks.count == 2 { return true }
            return false
        }
        
        func isOnePair() -> Bool {
            if let ranks = groupedByCount[2], ranks.count == 1 { return true }
            return false
        }
        
        if isFourOfAKind() { self = .fourOfAKind(sortedCards) }
        else if isStraight() { self = .straight(sortedCards) }
        else if isThreeOfAKind() { self = .threeOfAKind(sortedCards) }
        else if isTwoPair() { self = .twoPair(sortedCards) }
        else if isOnePair() { self = .onePair(sortedCards) }
        self = .highCard(sortedCards)
    }
    
    static func < (lhs: PokerHand, rhs: PokerHand) -> Bool {
        guard lhs.ranking == rhs.ranking else {
            return lhs.ranking < rhs.ranking
        }
        var (lhs, rhs) = (lhs.cards, rhs.cards)
        
        while !(lhs.isEmpty || rhs.isEmpty) {
            if lhs.removeFirst().rank < rhs.removeFirst().rank {
                return true
            }
        }
        return false
    }
    
    var cards: [Card] {
        switch self {
        case .highCard(let cards): return cards
        case .onePair(let cards): return cards
        case .twoPair(let cards): return cards
        case .threeOfAKind(let cards): return cards
        case .straight(let cards): return cards
        case .fourOfAKind(let cards): return cards
        }
    }
    
    var ranking: Int {
        switch self {
        case .highCard(_): return 0
        case .onePair(_): return 1
        case .twoPair(_): return 2
        case .threeOfAKind(_): return 3
        case .straight(_): return 4
        case .fourOfAKind(_): return 5
        }
    }
    
}
