//
//  main.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func getMenu() -> Int {
    var inputView = InputView()
    var menu = 0
    
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
    var menu = 0
    
    while true {
        menu = getMenu()
        do {
            print(try cardDeck.executeMenu(menu))
        }
        catch let error as InputError { print(error.rawValue) }
        catch let error as CardError { print(error.rawValue) }
        catch { print(error) }
    }
    
    
}

main()
