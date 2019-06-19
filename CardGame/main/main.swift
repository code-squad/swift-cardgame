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
            let totalCardCountAndMent = try menu.select(of: input)
            OutputView.printResult(menuNumber: input, input: totalCardCountAndMent)
        } catch let error as ErrorMessage {
            print(error.rawValue)
        } catch {
            print(error)
        }
    }
}

main()
