import Foundation

class InputControl {
    
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
        OutputView.show("총 \(deck.count)장의 카드가 남아있습니다.")
    }
    
    private func resetDeck() {
        deck.reset()
        OutputView.show("카드 덱을 초기화했습니다.")
    }
    
    private func shuffleDeck() {
        deck.shuffle()
        OutputView.show("\(deck.count)장의 카드를 섞었습니다.")
    }
    
    private func drawCard() {
        guard let card = deck.drawCard() else {
            OutputView.show("카드가 없어 뽑을 수 없습니다.")
            return
        }
        OutputView.show(card: card)
    }
}
