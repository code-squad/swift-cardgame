//
//  Card+Displayable.swift
//  CardGame
//
//  Created by hoemoon on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Card: Displayable {
	var text: String {
		return "\(figure.representation)\(number.representation)"
	}
}
