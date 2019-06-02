import Foundation

class InputControl {
    
    private var deck = Deck()
    
    private let options = [
        "덱 초기화",
        "덱 섞기",
        "카드 뽑기",
    ]
    
    func playCardGame() {
        while true {
            let choosenNumber = InputView.askForChoice(options: options)
            switch choosenNumber {
            case 1: resetDeck()
            case 2: shuffleDeck()
            case 3: drawCard()
            default: OutputView.show("없는 선택지입니다.")
            }
            OutputView.nextLine()
        }
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
