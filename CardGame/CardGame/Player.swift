import Foundation

class Player {
    
    private(set) var name: String
    private(set) var hand = Hand()
    
    init(name: String) {
        self.name = name
    }
    
}

class Dealer: Player {
    convenience init() {
        self.init(name: "딜러")
    }
}
