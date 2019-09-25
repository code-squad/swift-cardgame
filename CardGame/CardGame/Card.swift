//
//  Card.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Card {
	enum Figure {
		case spade
		case diamond
		case heart
		case clover
		
		var representation: String {
			switch self {
			case .spade: return "♠️"
			case .diamond: return "💎"
			case .heart: return "❤️"
			case .clover: return "🍀"
			}
		}
	}
	
	enum Number: Int {
		case one
		case two
		case three
		case four
		case five
		case six
		case seven
		case eight
		case nine
		case ten
		case eleven
		case twelve
		case thirteen
		
		var representation: String {
			switch self {
			case .one: return "A"
			case .eleven: return "J"
			case .twelve: return "Q"
			case .thirteen: return "K"
			default:
				return String(rawValue)
			}
		}
	}
	
	let figure: Figure
	let number: Number
}
