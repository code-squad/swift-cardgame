//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() throws {
    var deck = Deck()
    while let selectNumber = try InputView.readInput() {
        var resultMessgae = ""
        do {
            switch selectNumber {
                case CARD_RESET:
                    deck.reset()
                    resultMessgae = CARDGAME_RESET_MSG
                case CARD_SHUFFLE:
                    deck.shuffle()
                    resultMessgae = "\(CARDGAME_SHUFFLE_TOTAL_COMAND)\(deck.count())\(CARDGAME_SHUFFLE_BACK_COMAND)"
                case CARD_DRAW:
                    let drawCard = deck.removeOne()
                    resultMessgae = drawCard.desription()
                    resultMessgae += "\n"
                    resultMessgae += "\(CARDGAME_DRAW_TOTAL_COMAND)\(deck.count())\(CARDGAME_DRAW_BACK_COMAND)"
                default :
                    throw CardGaemError.isSelectNumber
                }
        }catch let e as CardGaemError {
            OutputView.errorMessage(e)
        }
        
        OutputView.showResult(resultMessgae)
    }
}

try main()
