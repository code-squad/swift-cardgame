import Foundation

struct CardGame {
    // 게임을 실행함
    static func play{
        var input: String
        input = inputView.input(message: "다음 메뉴를 선택해주세요")
        executeMenuOption(_: ChoiceMenu(rawValue: input), _: Deck)
    }
    
    // 메뉴를 실행함
    static private func executeMenuOption(_ menu: ChoiceMenu, _ Deck: Deck) {
        switch menu {
        //카드를 리셋하는 경우, Deck에서 reset()을 호출하고 outputView에 count를 넘겨주고 이를 호출함
        case .resetCard:
            Deck.reset()
            outputView.ResetAlert(in: cardDeck.count())
        //카드를 셔플하는 경우, Deck에서 shuffle()을 호출하고 outputView에 count를 넘겨주고 이를 호출함
        case .shuffleCard:
            Deck.shuffle()
            outputView.SuffleAlert(in: cardDeck.count())
        //카드를 하나 뽑는 경우, Deck에서 removeOne()을 호출해 카드 하나를 뽑은 다음에 outputView에 count와 card를 넘겨주고 호출함
        case .pickCard():함
            let card = Deck.removeOne()
            outputView.PickAlert(in: cardDeck.count(), with: card)
        }
    }
}
