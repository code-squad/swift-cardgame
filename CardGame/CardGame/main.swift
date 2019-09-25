//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
	let card1 = Card(figure: .clover, number: .eight)
	let card2 = Card(figure: .heart, number: .twelve)
	OutputView.display(card1)
	OutputView.display(card2)
}

main()
