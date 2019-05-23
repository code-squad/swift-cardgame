//
//  main.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func getMenu() -> Menu {
    var inputView = InputView()
    var menu: Menu = Menu.reset
    
    while true {
        inputView.printMenu()
        inputView.readInput()
        do {
            menu = try MenuChecker.checkMenu(inputView.valueEntered)
            break
        }
        catch let error as InputError { print(error.rawValue) }
        catch { print(error) }
    }
    
    return menu
}

func main() {
    var cardDeck = CardDeck()
    var menu: Menu
    let outputView = OutputView()
    
    while true {
        menu = getMenu()
        do {
            outputView.printMessage(menu, cardReturned: try cardDeck.executeMenu(menu), cardDeck.count())
        }
        catch let error as InputError { print(error.rawValue) }
        catch let error as CardError { print(error.rawValue) }
        catch { print(error) }
    }
    
}

main()
