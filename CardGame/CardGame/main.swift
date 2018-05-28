//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let deck = Deck()
    var deeler = Deeler(deck)
    
    while true {
//        입력 부 주석 처리
//        OutputView.cardGameSelectMassgae()
//        var order: CARDGAME.MENU?
        
        do {
//            order = try InputView.order()
//            try deeler.receivedOrder(order)
        }catch let e as CardGaemError {
            OutputView.errorMessage(e)
        }catch {
            print(error)
        }
        OutputView.deelerMessage(deeler)
    }
}

main()
