//
//  CardDeck.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDeck {
    private var cardList : [Card]
    var deckSize : Int {
        return cardList.count
    }
    
    init (){
        self.cardList = [Card]()
        fillCardList()
    }
    ///카드 초기화
    func reset(){
        self.cardList.removeAll()
        fillCardList()
    }
    
    ///카드 하나 뽑기
    func removeOne() -> Result<Card, DrawCardError> {
        guard let drawOne = cardList.popLast() else {
            return .failure(.noMoreCardInDeck)
        }
        return .success(drawOne)
    }
    
    ///카드 셔플 by mordern method
    //    for i from n−1 downto 1 do
    //    j ← random integer such that 0 ≤ j ≤ i
    //    exchange a[j] and a[i]
    func shuffle(){
        for index in 0..<deckSize {
            let randomNumber = Int.random(in: 0..<deckSize-index)
            if randomNumber != index {
                swap(lhs: index, rhs: randomNumber)
            }
        }
    }
    
    private func swap (lhs: Int, rhs: Int) {
        let temp: Card = cardList[lhs]
        cardList[lhs] = cardList[rhs]
        cardList[rhs] = temp
    }
    
    private func fillCardList()  {
        for type in CardType.allCases {
            fillCardListByType(cardType: type)
        }
    }
    
    ///타입별로 카드 생성
    private func fillCardListByType(cardType: CardType){
        for cardNumber in CardNumber.allCases{
            self.cardList.append(Card(type: cardType, number: cardNumber))
        }
    }
}
