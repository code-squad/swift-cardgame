import Foundation

class CardGame {
    
    private var deck = Deck()
    private(set) var players = [Player]()
    private(set) var dealer = Dealer()
    
    enum GameRule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    enum Error: Swift.Error {
        case outOfCards
        case playerLimitExceeded
    }
    
    func addPlayers(count: Int) throws {
        guard count <= 4, count >= 1 else {
            throw Error.playerLimitExceeded
        }
        for index in 1...count {
            players.append(Player(name: "참가자#\(index)"))
        }
    }
    
    func giveCardsToPlayers(rule: GameRule) throws {
        deck.shuffle()
        for player in players {
            try player.drawCards(from: &deck, count: rule.rawValue)
        }
        try dealer.drawCards(from: &deck, count: rule.rawValue)
    }
}
