//
//  OutputView.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
	static func showGameTypeMenu() {
		print("카드 게임 종류를 선택하세요. ")
		for (index, gameType) in CardGameType.allCases.enumerated() {
			print("\(index + 1). \(gameType.description)")
		}
	}
	
	static func showCountOfPlayerMessage() {
		print("참여할 사람의 인원을 입력하세요.")
	}
		
	static func show(result: ResultRepresentable) {
		let messages = result.messages.map { "[" + $0 + "]" }
		for (index, message) in messages.enumerated() {
			print("참가자#\(index + 1) \(message)")
			if index == result.messages.count - 1 {
				print("딜러 \(message)")
			}
		}
		print()
	}
	
	static func show(error: HandlableError) {
		print(error.message)
		print()
	}
	
	static func showAlert() {
		print("알 수 없는 오류 발생")
	}
}
