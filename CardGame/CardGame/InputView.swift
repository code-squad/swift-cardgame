//
//   InputView.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
	enum InputError: Error {
		case invalidInput
		
		var message: String {
			return "잘못된 입력"
		}
	}
	
	static func readInput() throws -> Menu {
		guard let string = readLine() else {
			throw InputError.invalidInput
		}
		guard let integer = Int(string) else {
			throw InputError.invalidInput
		}
		guard let menu = Menu(rawValue: integer-1) else {
			throw InputError.invalidInput
		}
		return menu
	}
}

