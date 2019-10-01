//
//   InputView.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol HandlableError {
	var message: String { get }
	var needQuit: Bool { get }
}

struct InputView {
	enum InputError: Error, HandlableError {
		case invalidGameType
		case invalidCountOfPlayers
		case invalidType
		
		var message: String {
			switch self {
			case .invalidGameType:
				return "잘못된 게임 형식을 입력하였습니다."
			case .invalidCountOfPlayers:
				return "잘못된 플레이어 수를 입력하였습니다. 1-4까지 입력 가능합니다."
			case .invalidType:
				return "잘못된 형식의 데이터를 입력하였습니다."
			}
		}
		
		var needQuit: Bool {
			false
		}
	}
	
	static func readCardGameInput() throws -> CardGameType {
		let integer = try readInteger()
		guard let game = CardGameType(input: integer) else {
			throw InputError.invalidGameType
		}
		return game
	}
	
	static func readCountOfPlayers() throws -> Int {
		let integer = try readInteger()
		guard (1...4).contains(integer) else {
			throw InputError.invalidCountOfPlayers
		}
		return integer
	}
	
	private static func readInteger() throws -> Int {
		guard let string = readLine() else {
			throw InputError.invalidType
		}
		guard let integer = Int(string) else {
			throw InputError.invalidType
		}
		return integer
	}
}

