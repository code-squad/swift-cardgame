//
//  drawError.swift
//  CardGame
//
//  Created by jang gukjin on 20/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum DrawError: String, Error {
    case noCard = "더이상 카드가 없어 게임이 종료됩니다."
}
