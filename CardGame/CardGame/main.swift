//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 보드 생성
    let gameBoard = GameBoard()
    
    // 카드 생성
    guard let card = gameBoard.makeRandomCard() else {
        return ()
    }
    // 생성된 카드 정보를 프린트
    print(card.getInfo())
}

main()

