//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let cardDeck = CardDeck()
    var dealer = Dealer(deck: cardDeck)
    repeat {
        let menuNumber = InputView.readMenuNumber()
        do {
            try dealer.config(number: menuNumber)
        } catch let error as Dealer.Error {
            print(error.localizedDescription)
            break
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            break
        }
        OutputView.printGameResult(dealer: dealer)
    } while (true)
}

main()
