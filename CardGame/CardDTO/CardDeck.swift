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
    
    ///카드 셔플
    func shuffle(){
        self.cardList.shuffle()
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
