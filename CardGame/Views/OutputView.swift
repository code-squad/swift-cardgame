//
//  OutputView.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class OutputView {
    static func displayMenuResult(_ selected:GameMenu, deck: CardDeck){
        print("\(selected.getResultMessage(cardDeck: deck))")
    }
    static func printCard(_ card: Card){
        print(card)
    }
    static func displayDrawCardErrorAutoHandleMessage(){
        print("잔여카드가 없으므로 카드덱을 초기화합니다.")
    }
}
