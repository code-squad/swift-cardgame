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
    do {
        try deeler.receivedOrder(CARDGAME.MENU.SHUFFLE)
    }catch let e as CardGaemError {
        OutputView.errorMessage(e)
    }catch {
        print(error)
    }
    deeler.fieldCardMaker()
    OutputView.fieldAsk(deeler)
}

main()
