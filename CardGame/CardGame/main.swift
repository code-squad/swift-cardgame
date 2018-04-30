//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

while true {
    let inputView = InputView()
    let cardDeck = CardDeck()
    let outputView = OutputView(cardDeck)
    let cardStack = CardStack()
    outputView.printNumberOfCard()
    let numberOfCard = inputView.inputCard()
    guard numberOfCard == "1" || numberOfCard == "2" else {
        print("카드 선택을 다시 해주세요.")
        continue
    }
    outputView.printNumberOfPlayer()
    let numberOfPlayer = inputView.inputPlyer()
    guard numberOfPlayer == "1" || numberOfPlayer == "2" || numberOfPlayer == "3" || numberOfPlayer == "4" else {
        print("참여 인원은 최소 1명 부터 최대 4명 입니다")
        continue
    }
    var cards = 0
    var player = 0
    switch numberOfCard {
    case "1": cards = 6
    case "2": cards = 4
    default: continue
    }
    switch numberOfPlayer {
    case "1": player = 1
    case "2": player = 2
    case "3": player = 3
    case "4": player = 4
    default: continue
    }
    cardStack.makeCardStack(cardDeck, player, cards)
    outputView.printCardStack(cardStack, player)
}

