//
//  Game.swift
//  CardGame
//
//  Created by hoemoon on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Game {
	enum GameError: Error, HandlableError {
		case insufficientCard
		
		var message: String {
			"카드가 부족해서 게임을 종료합니다."
		}
		var needQuit: Bool {
			true
		}
	}
	
	static func makeResult(gameType: CardGameType, playerCount: Int, deck: Deck) throws-> ResultRepresentable {
		guard deck.count() > gameType.rawValue * (playerCount + 1) else {
			throw GameError.insufficientCard
		}
		deck.shuffle()
		return GameResult(
			messages: Array(1...playerCount)
				.map { _ in result(deck: deck, gameType: gameType) }
		)
	}
	
	private static func result(deck: Deck, gameType: CardGameType) -> String {
		Array(1...gameType.rawValue)
			.compactMap { _ in try? deck.removeOne() }
			.map { $0.description }
			.joined(separator: ", ")
	}
}

