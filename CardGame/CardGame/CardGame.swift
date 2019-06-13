import Foundation

enum CardGameError: Error {
    case outOfCards
    case playerLimitExceeded
}

class CardGame {
    
    private var deck = Deck()
    private(set) var players = [Player]()
    private(set) var dealer = Dealer()
    
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        static let options = ["5카드", "7카드"]
        
        init?(choice: String) {
            switch choice {
            case CardGame.Rule.options[0]: self = .fiveCardStud
            case CardGame.Rule.options[1]: self = .sevenCardStud
            default: return nil
            }
        }
    }
    
    func addPlayers(count: Int) throws {
        guard count <= 4, count >= 1 else {
            throw CardGameError.playerLimitExceeded
        }
        for index in 1...count {
            players.append(Player(name: "참가자#\(index)"))
        }
    }
    
    func giveCardsToPlayers(rule: Rule) throws {
        deck.shuffle()
        for player in players {
            player.resetHand()
            try player.drawCards(from: &deck, count: rule.rawValue)
        }
        dealer.resetHand()
        try dealer.drawCards(from: &deck, count: rule.rawValue)
    }
}
