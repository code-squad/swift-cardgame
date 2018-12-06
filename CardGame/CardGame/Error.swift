//
//  File.swift
//  CardGame
//
//  Created by 김장수 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum ProcessError: String {
    case invalidMode = "게임 종류를 정확히 선택하세요."
    case invalidPlayer = "참여할 사람을 정확히 입력하세요."
    case gameOver = "카드가 부족합니다. 종료합니다."
}
