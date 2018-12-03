//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    InputView.readStart(ment: "카드를 무작위로 생성합니다.")
    let trump = Trump()
    OutputView.printCard(with: trump)
}

main()
