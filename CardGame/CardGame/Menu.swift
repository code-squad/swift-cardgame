//
//  Menu.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardGameType: Int, CaseIterable, CustomStringConvertible {
	case seven = 7
	case five = 5
	
	init?(input: Int) {
		if input == 1 {
			self = .seven
			return
		}
		if input == 2 {
			self = .five
			return
		}
		return nil
	}
	
	var description: String {
		switch self {
		case .seven: return "7카드"
		case .five: return "5카드"
		}
	}	
}

