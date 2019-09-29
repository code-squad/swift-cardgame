//
//  Menu.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int, CaseIterable, CustomStringConvertible {
	case reset
	case shuffle
	case pickOne
	
	var description: String {
		switch self {
		case .reset: return "1. 카드 초기화"
		case .shuffle:  return "2. 카드 섞기"
		case .pickOne: return "3. 카드 하나 뽑기"
		}
	}	
}

