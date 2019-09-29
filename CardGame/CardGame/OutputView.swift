//
//  OutputView.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
	static func showMenu() {
		let allMenu = Menu.allCases
			.map { $0.description }
			.joined(separator: "\n")
		print(allMenu)
	}
	
	static func showResult(menu: Menu, deck: Deck) {
		var message = ""
		switch menu {
			case .reset:
				deck.reset()
				message += "카드 전체를 초기화했습니다."
				message += "총 \(deck.count())장의 카드가 있습니다."
			case .shuffle:
				deck.shuffle()
				message += "전체 \(deck.count())장의 카드를 섞었습니다."
			case .pickOne:
				do {
					let pick = try deck.removeOne()
					message += pick.description
					message += "총 \(deck.count())장의 카드가 남아있습니다."
				} catch {
					message += "카드를 뽑는 도중 오류가 발생했습니다."
				}
		}
		print(message)
		print()
	}
}

