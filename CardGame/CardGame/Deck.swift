//
//  Deck.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Deck {
	enum DeckError: Error {
		case failedRemoveCard
	}
	private var cards: [Card]
	private static func makeDeck() -> [Card] {
		var cards = [Card]()
		for figure in Card.Figure.allCases {
			for number in Card.Number.allCases {
				cards.append(Card(figure: figure, number: number))
			}
		}
		return cards
	}
	
	init() {
		cards = Deck.makeDeck()
	}
	// 갖고 있는 카드 개수를 반환한다.
	func count() -> Int {
		cards.count
	}
	
	// 전체 카드를 랜덤하게 섞는다.
	func shuffle() {
		cards = cards.shuffled()
	}
	
	// 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
	func removeOne() throws -> Card {
		guard cards.count > 0 else {
			throw DeckError.failedRemoveCard
		}
		return cards.removeFirst()
	}
	
	// 처음처럼 모든 카드를 다시 채워넣는다.
	func reset() {
		cards = Deck.makeDeck()
	}
}
