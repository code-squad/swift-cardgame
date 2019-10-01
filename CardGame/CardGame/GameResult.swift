//
//  GameResult.swift
//  CardGame
//
//  Created by hoemoon on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol ResultRepresentable {
	var primaryMessage: String { get }
	var secondaryMessage: String { get }
}

struct GameResult: ResultRepresentable {
	let primaryMessage: String
	let secondaryMessage: String
	
	init(primaryMessage: String,
			 secondaryMessage: String) {
		self.primaryMessage = primaryMessage
		self.secondaryMessage = secondaryMessage
	}
}
