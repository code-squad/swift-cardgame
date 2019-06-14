import Foundation

enum CardGameError: Error, CustomStringConvertible {
    case outOfCards
    case playerLimitExceeded
    var description: String {
        switch self {
        case .outOfCards:
            return "카드가 다 떨어짐"
        case .playerLimitExceeded:
            return "플레이어 제한 초과함"
        }
    }
}

class CardGame {
    
    private var deck = Deck()
    private(set) var players = [Player]()
    private(set) var dealer = Dealer()
    
    /// Raw Value로 나눠주어야 하는 카드 개수를 가지고 있습니다.
    enum Rule: Int, CaseIterable, CustomStringConvertible {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        var description: String {
            return "\(self.rawValue)카드 스터드"
        }
    }
    
    func addPlayers(count: Int) -> Result<String, CardGameError> {
        guard count <= 4, count >= 1 else {
            return .failure(.playerLimitExceeded)
        }
        for index in 1...count {
            players.append(Player(name: "참가자#\(index)"))
        }
        return .success(players.map { $0.name }.joined())
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
