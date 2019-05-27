//
//  main.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func main() {
    let inputView = InputView()
    let outputView = OutputView()
    var cardGame = CardGame()
    var menu: Menu
    var userCount: UserCount
    var Participant: ([Player], Dealer)
    var input: (String, String)
    
    while true {
        input = inputView.readInput()
        
        do {
            (menu, userCount) = try MenuChecker.checkMenu(input)
        }
        catch let error as InputError {
            print(error.rawValue)
            continue
        }
        catch {
            print(error)
            continue
        }

        if menu == .exit {
            return
        }

        do {
            Participant = try cardGame.executeMenu(menu, userCount)
            outputView.printMessage(Participant)
            cardGame.gameEnd()
        }
        catch let error as CardError {
            print(error.rawValue)
            return
        }
        catch {
            print(error)
        }
    }
}

main()

