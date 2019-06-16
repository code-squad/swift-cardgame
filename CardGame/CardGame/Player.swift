import Foundation

class Player: Comparable {
    
    private(set) var name: String
    private(set) var hand = [Card]()
    
    init(name: String) {
        self.name = name
    }
    
    func drawCard(from deck: inout Deck) throws {
        guard let card = deck.drawCard() else {
            throw CardGameError.outOfCards
        }
        hand.append(card)
    }
    
    func drawCards(from deck: inout Deck, count: Int) throws {
        for _ in 1...count {
            try drawCard(from: &deck)
        }
    }
    
    func resetHand() {
        hand.removeAll()
    }
    
    private var matchCount: [Int: [Card.Rank]] {
        let groupedByRank = Dictionary(grouping: hand) { $0.rank }
        let groupedByCount = Dictionary(grouping: groupedByRank) { $1.count }
        let matchInfo = groupedByCount.mapValues { $0.map { $0.key } }
        return matchInfo.mapValues { $0.sorted { $0 > $1 } }
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        
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
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        
        
        
        
        return true
    }
    
}

class Dealer: Player {
    convenience init() {
        self.init(name: "딜러")
    }
}
