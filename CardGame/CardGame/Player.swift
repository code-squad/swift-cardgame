import Foundation

class Player: Comparable {
    
    private(set) var name: String
    private(set) var hand = Hand()
    
    init(name: String) {
        self.name = name
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.hand.score < rhs.hand.score
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.hand.score == rhs.hand.score
    }
    
}

class Dealer: Player {
    convenience init() {
        self.init(name: "딜러")
    }
}
