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
			let result = Game.makeResult(menu: menu, deck: deck)
			OutputView.show(result)
		} catch let inputError as InputView.InputError {
			OutputView.showError(with: inputError.message)
		} catch {
			OutputView.showAlert()
			break
		}
	}
}

main()
