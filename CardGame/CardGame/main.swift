//
//  main.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation



func main() {
    var cardDeck = CardDeck()
    let inputView = InputView()
    let outputView = OutputView()
    let menuGetter = MenuGetter()
    var menu: Menu
    
    while true {
        do {
            menu = try menuGetter.getMenu(inputView)
            outputView.printMessage(menu, cardReturned: try cardDeck.executeMenu(menu), cardDeck.count())
        }
        catch let error as InputError { print(error.rawValue) }
        catch let error as CardError { print(error.rawValue) }
        catch { print(error) }
    }
}

main()
