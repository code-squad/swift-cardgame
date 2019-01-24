//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

// 만들고 -> 출력
func main() {
    let card = CardFactory.createRandomCard()
    OutputView.output(card)
}

main()
