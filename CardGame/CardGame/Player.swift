import Foundation

class Player {
    
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
}

class Dealer: Player {
    convenience init() {
        self.init(name: "딜러")
    }
}
