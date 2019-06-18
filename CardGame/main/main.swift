//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    var cardDeck = CardDeck()
    
    while true {
        let input = InputView.announceMent()
        do {
            if input == "0" {
                break
            }
            let totalCardCount = try cardDeck.distinctNumber(of: input)
            OutputView.printResult(menuNumber: input, inputNumber: totalCardCount, card: cardDeck.oneCard)
        } catch let error as ErrorMessage {
            print(error.rawValue)
        } catch {
            print(error)
        }
    }
}

main()
