//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
	let deck = Deck()
	while true {
		do {
			OutputView.showMenu()
			let menu = try InputView.readInput()
			OutputView.showResult(menu: menu, deck: deck)
		} catch let inputError as InputView.InputError {
			print(inputError.message)
		} catch {
			print(error)
		}
	}
}

main()
