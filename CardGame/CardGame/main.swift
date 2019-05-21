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
    
    
}

main()
