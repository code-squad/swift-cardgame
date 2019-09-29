//
/******************************************************************************
 * File Name        : UserMenu.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

enum UserMenu: Int, CaseIterable {
    case unknown = -1
    case reset = 1
    case suffle
    case pickOne
    
    var menuText: String {
        switch self {
            case .reset: return "1. 카드 초기화"
            case .suffle: return "2. 카드 섞기"
            case .pickOne: return "3. 카드 하나 뽑기"
            case .unknown:  return "잘못된 입력: 다시 입력해주세요"
        }
    }
    
    func resultText(cardCount: Int) -> String {
        switch self {
            case .reset: return "카드 전체를 초기화 했습니다. \n총 \(cardCount)장의 카드가 있습니다. "
            case .suffle: return "전체 \(cardCount)장의 카드를 섞었습니다."
            case .pickOne: return "총 \(cardCount)장의 카드가 남아있습니다."
            case .unknown: return ""
        }
    }
    
}
