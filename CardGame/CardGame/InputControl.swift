import Foundation

struct InputControl {
    
    private var deck = Deck()
    
    enum Option: Int, CaseIterable, CustomStringConvertible {
        case resetDeck = 1
        case shuffleDeck
        case drawCard
        case showOptions
        var description: String {
            switch self {
            case .drawCard: return "카드 뽑기"
            case .resetDeck: return "덱 초기화"
            case .showOptions: return "선택지 보기"
            case .shuffleDeck: return "덱 섞기"
            }
        }
    }
    
    func playCardGame() {
        
    }
    
    private func showDeckCount() {
        
    }
    
    private func resetDeck() {
        
    }
    
    private func shuffleDeck() {
        
    }
    
    private func drawCard() {
        
    }
}
