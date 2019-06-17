import Foundation

struct Score: Comparable {
    
    enum PokerHand: Int, Comparable {
        case highCard
        case onePair
        case twoPair
        case threeOfAKind
        case straight
        case fourOfAKind
        
        static func < (lhs: Score.PokerHand, rhs: Score.PokerHand) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
    
    private var pokerHand: PokerHand
    private var matchedCards: [Card]
    private var extraCards: [Card]
    
    init(cards: [Card]) {
        
        let groupedByRank = Dictionary(grouping: cards) { $0.rank }
        let groupedByCount = Dictionary(grouping: groupedByRank) { $1.count }
        let matchInfo = groupedByCount.mapValues { $0.flatMap { $0.value } }
        
        //MARK: PokerHand 분석
        func makeFourOfAKind() -> [Card]? {
            if let matchedRanks = matchInfo[4] {
                return matchedRanks
            }
            return nil
        }
        
        func makeStraight() -> [Card]? {
            
            let ranks = cards.map { $0.rank }
            var straightCards = [Card]()
            
            for rank in Card.Rank.allCases {
                if let index = ranks.index(of: rank) {
                    straightCards.append(cards[index])
                    if straightCards.count >= 5 {
                        return straightCards
                    }
                } else {
                    straightCards.removeAll()
                }
            }
            return nil
        }
        
        func makeThreeOfAKind() -> [Card]? {
            if let matchedRanks = matchInfo[3] {
                return matchedRanks
            }
            return nil
        }
        
        func makeTwoPair() -> [Card]? {
            if let matchedRanks = matchInfo[2], matchedRanks.count == 2 {
                return matchedRanks
            }
            return nil
        }
        
        func makeOnePair() -> [Card]? {
            if let matchedRanks = matchInfo[2], matchedRanks.count == 1 {
                return matchedRanks
            }
            return nil
        }
        
        let matchedCards: [Card]
        
        if let fourOfAKind = makeFourOfAKind() {
            pokerHand = .fourOfAKind
            matchedCards = fourOfAKind
        } else if let straight = makeStraight() {
            pokerHand = .straight
            matchedCards = straight
        } else if let threeOfAKind = makeThreeOfAKind() {
            pokerHand = .threeOfAKind
            matchedCards = threeOfAKind
        } else if let twoPair = makeTwoPair() {
            pokerHand = .twoPair
            matchedCards = twoPair
        } else if let onePair = makeOnePair() {
            pokerHand = .onePair
            matchedCards = onePair
        } else {
            pokerHand = .highCard
            matchedCards = cards
        }
        self.matchedCards = matchedCards.sorted { $0.rank > $1.rank }
        extraCards = cards.filter { matchedCards.contains($0) }.sorted { $0.rank > $1.rank }
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        
        guard lhs.pokerHand == rhs.pokerHand else {
            return lhs.pokerHand < rhs.pokerHand
        }
        
        var (lhsMatched, rhsMatched) = (lhs.matchedCards, rhs.matchedCards)
        while !(lhsMatched.isEmpty || rhsMatched.isEmpty) {
            if lhsMatched.removeFirst().rank < rhsMatched.removeFirst().rank {
                return true
            }
        }
        
        var (lhsExtra, rhsExtra) = (lhs.extraCards, rhs.extraCards)
        while !(lhsExtra.isEmpty || rhsExtra.isEmpty) {
            if lhsExtra.removeFirst().rank < rhsExtra.removeFirst().rank {
                return true
            }
        }
        return false
    }
    
}


