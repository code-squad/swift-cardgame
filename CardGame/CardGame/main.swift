//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func cardDeckGame() {
    let inputView = InputView()
    let outputView = OutputView()
    let cardGame = CardDeckGame(viewForInput: inputView, viewForOutput: outputView)
    cardGame.playGame(numberOfTimes: 100)
}

func pockerDealerGame() {
    let inputView = PockerDealerInputView()
    let outputView = PockerDealerOutputView()
    let pockerGame = PockerDealerGame(viewForInput: inputView, viewForOutput: outputView)
    pockerGame.playGame()
}



func main() {
    pockerDealerGame()
}

main()
