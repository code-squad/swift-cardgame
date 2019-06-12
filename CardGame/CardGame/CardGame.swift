import Foundation

class CardGame {
    
    private var deck = Deck()
    private var players = [Player]()
    private var dealer = Player(name: "딜러")
    
    enum GameRule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    enum CardGameError: Error {
        case notEnoughCards
    }
    
    func addPlayers(count: Int) {
        for index in 1...count {
            players.append(Player(name: "참가자#\(index)"))
        }
    }
    
    func giveCardsToPlayers(rule: GameRule) throws {
        for index in players.indices {
            players[index].hand = try drawCards(count: rule.rawValue)
        }
        dealer.hand = try drawCards(count: rule.rawValue)
    }
    
    func drawCards(count: Int) throws -> [Card] {
        var cards = [Card]()
        for _ in 1...count {
            guard let card = deck.drawCard() else {
                throw CardGameError.notEnoughCards
            }
            cards.append(card)
        }
        return cards
    }
}
