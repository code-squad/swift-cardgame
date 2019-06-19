import Foundation

enum CardGameError: Error {
    case outOfCards
    case playerLimitExceeded
    
    var localizedDescription: String {
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
    private(set) var rule: Rule
    
    init(rule: Rule, playerCount: Int) throws {
        self.rule = rule
        guard playerCount <= 4, playerCount >= 1 else {
            throw CardGameError.playerLimitExceeded
        }
        for index in 1...playerCount {
            players.append(Player(name: "참가자#\(index)"))
        }
    }
    
    /// Raw Value로 나눠주어야 하는 카드 개수를 가지고 있습니다.
    enum Rule: Int, CaseIterable, CustomStringConvertible {
        case fiveCardStud = 5
        case sevenCardStud = 7
        
        var description: String {
            return "\(self.rawValue)카드 스터드"
        }
    }
    
    
    func giveCardsToPlayers() throws {
        deck.shuffle()
        for player in players {
            player.hand.reset()
            player.hand.addCards(try deck.drawCards(count: rule.rawValue))
        }
        dealer.hand.reset()
        dealer.hand.addCards(try deck.drawCards(count: rule.rawValue))
    }
    
    var winner: Player {
        let sorted = players.sorted(by: >)
        return sorted[0]
    }
}
