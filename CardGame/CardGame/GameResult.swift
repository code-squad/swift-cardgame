//
//  GameResult.swift
//  CardGame
//
//  Created by hoemoon on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol ResultRepresentable {
	var messages: [String] { get }
}

struct GameResult: ResultRepresentable {
	let messages: [String]
}
