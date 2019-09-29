//
//  CardGameOuputView.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PockerGameOuputView: PockerGameSubscriber {
    
    func didFinishGame(game: PockerGame) {
        //print("\(game)")
    }
    
    func didDistributeCard(game: PockerGame) {
        print("\(game)\n")
    }
    
    func didResetCardDeck(cardDeck: CardDeck) {
        print("카드 전체를 초기화했습니다.\n총 \(cardDeck.cards.count)장의 카드가 있습니다.")
    }
    
    func didShuffleCardDeck(cardDeck: CardDeck) {
         print("전체 \(cardDeck.cards.count)장의 카드를 섞었습니다.")
    }
}
