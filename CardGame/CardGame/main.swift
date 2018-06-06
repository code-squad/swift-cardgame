//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardGame: CardGame? = nil
    do {
        let rule = try InputView.readGameRule()
        let numberOfPlayer = try InputView.readNumberOfPlater()
        cardGame = CardGame(rule, numberOfPlayer)
    }catch let e as CARDGAME.ERROR {
        OutputView.errorMessage(e)
    }catch {
        print(error)
    }
    cardGame?.start()
}

main()
