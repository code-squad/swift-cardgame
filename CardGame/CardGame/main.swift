//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck: CardDeckable = CardDeck()
    while true {
        do {
            let menu = try InputView.selectMenu()
            OutputView.printResult(cardDeck: &cardDeck, menu: menu)
        } catch let error as Menu.Error {
            print(error.errorMessage)
        } catch {
            fatalError("Unexpected Error")
        }
    }
}

main()
