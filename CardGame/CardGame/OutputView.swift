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
		
	static func show(_ result: ResultRepresentable) {
		print(result.primaryMessage)
		if result.secondaryMessage.count > 0 {
			print(result.secondaryMessage)
		}
		print()
	}
	
	static func showError(with message: String) {
		print(message)
		print()
	}
	
	static func showAlert() {
		print("알 수 없는 오류 발생")
	}
}
