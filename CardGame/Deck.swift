import Foundation

class CardDeck {
    private var cardDeck: [Card]
    
    //cardDeck 초기화
    init() {
        cardDeck = []
    }
    
    //이전 덱을 클리어하고, 새로운 카드 덱 생성하기
    private func createNewDeck() {
        cardDeck.removeAll()
        for shapeRaw in 1...5{
            for numberRaw in 1...13{
                guard let shape = shape(rawValue: shapeRaw) else { return }
                guard let number = shape(rawValue: numberRaw) else { return }
                cardDeck.append(Card(shape, number))
            }
        }
    }
    
    //카드 덱의 현재 카드 수를 반환
    func count() -> Int {
        return cardDeck.count
    }
    
    //카드 덱 셔플하기
    private func shuffle() {
        var tempCard: Card
        var tempCardDeck: [Card] = []
        for step in stride(from: cardDeck.count, through: 0, by: -1) { //stride 구문
            tempCard = cardDeck.remove(at: Int(arc4random_uniform(UInt32(step))))
            tempCardDeck.append(tempCard)
        }
        cardDeck = tempCardDeck
    }
    
    //카드 리셋하기 위하여 createNewDeck() 함수를 호출함
    func reset() {
        createNewDeck()
    }
    
    //카드 덱에서 마지막 인스턴스만 반환하기
    func removeOne() -> Card {
        return cardDeck.remove(at: cardDeck.count)
    }
}
//end of code
