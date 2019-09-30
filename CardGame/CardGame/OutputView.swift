//
//  OutputView.swift
//  CardGame
//
//  Created by temphee.Reid on 30/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


struct OutputView {
    static func showResult(choosenMenu:Int, cardDeck: CardDeck) throws {
        switch choosenMenu {
        case 1:
            cardDeck.reset()
            print("카드 전체를 초기화 했습니다")
            //print(cardDeck)
            print("총 \(cardDeck.count()) 장의 카드가 있습니다")
            
        case 2:
            //print(cardDeck)
            cardDeck.shuffle()
            print("전체 \(cardDeck.count()) 장의 카드를 섞었습니다")
        //print(cardDeck)
        case 3:
            let card = try cardDeck.removeOne()
            print(card)
            print("총 \(cardDeck.count()) 장의 카드가 남았습니다.")
            //print(cardDeck)
            
        default :
            throw CardGameError.invalidMenumNumber
        }
        
        print("")
    
    }
}
