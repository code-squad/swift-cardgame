import Foundation

class CardGame {
    
    var deck = Deck()
    
    enum GameType {
        
        case fiveCardStud, sevenCardStud
        
        var numberOfCards: Int {
            switch self {
            case .fiveCardStud: return 5
            case .sevenCardStud: return 7
            }
        }
    }
    
    enum CardGameError: Error {
        case notEnoughCards
    }
    
    func playGame(playerCount: Int, gameType: GameType) throws {
        
        deck.shuffle()
        var playerHands = [[Card]](repeating: [], count: playerCount)
        
        for index in playerHands.indices {
            guard let card = deck.drawCard() else {
                throw CardGameError.notEnoughCards
            }
            playerHands[index].append(card)
        }
        
        
        
    }
    
}
