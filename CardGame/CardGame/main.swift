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
			OutputView.showGameTypeMenu()
			let type = try InputView.readCardGameInput()
			OutputView.showCountOfPlayerMessage()
			let count = try InputView.readCountOfPlayers()
			let result = try Game.makeResult(gameType: type, playerCount: count, deck: deck)
			OutputView.show(result: result)
		} catch let handlable as HandlableError {
			OutputView.show(error: handlable)
			if handlable.needQuit {
				break
			}
		} catch {
			OutputView.showAlert()
			break
		}
	}
}

main()
