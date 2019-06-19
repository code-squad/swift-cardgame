//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    let cardDeck = CardDeck()
    var menu = Menu(deck: cardDeck)
    
    while true {
        let input = InputView.announceMent()
        do {
            let totalCardCount = try menu.select(of: input)
            OutputView.printResult(menuNumber: input, inputNumber: totalCardCount)
        } catch let error as ErrorMessage {
            print(error.rawValue)
        } catch {
            print(error)
        }
    }
}

main()
