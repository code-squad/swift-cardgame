//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

// 기존 메인코드는 tempBranchForCradGame 브랜치에 푸시해놓았습니다.

var cardDeck = CardDeck()
cardDeck.shuffle()
let cardTable = cardDeck.makeCardTable()
OutputView.printCardTable(cardTable)
