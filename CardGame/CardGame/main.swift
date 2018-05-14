//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let numberOfCardStack: Int = 7
    let cardGame: CardGame = CardGame(numberOfCardStack)
    // 카드덱 섞지 않고 출력해보기
    cardGame.dealOutCard()
    OutputView.printCardStack(cardGame, numberOfCardStack: numberOfCardStack)
    cardGame.resetGame()
    // 카드덱을 섞고 출력해보기
    print()
    cardGame.shuffleCard()
    cardGame.dealOutCard()
    OutputView.printCardStack(cardGame, numberOfCardStack: numberOfCardStack)
}

main()
