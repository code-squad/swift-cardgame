//
//  Game.swift
//  CardGame
//
//  Created by hoemoon on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Game {
	static func makeResult(menu: Menu, deck: Deck) -> ResultRepresentable {
		var primaryMessage = ""
		var secondaryMessage = ""
		switch menu {
		case .reset:
			deck.reset()
			primaryMessage = "카드 전체를 초기화했습니다."
			secondaryMessage = "총 \(deck.count())장의 카드가 있습니다."
		case .shuffle:
			deck.shuffle()
			primaryMessage = "전체 \(deck.count())장의 카드를 섞었습니다."
		case .pickOne:
			do {
				let pick = try deck.removeOne()
				primaryMessage = pick.description
				secondaryMessage = "총 \(deck.count())장의 카드가 남아있습니다."
			} catch {
				primaryMessage = "카드를 뽑는 도중 오류가 발생했습니다."
			}
		}
		return GameResult(
			primaryMessage: primaryMessage,
			secondaryMessage: secondaryMessage
		)
	}
}

