//
/******************************************************************************
 * File Name        : PockerDealerMenu.swift
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


enum PockerDealerMenu: Int, CaseIterable {
    case unknown = -1
    case sevenCard = 1
    case fiveCard
    
    var menuText: String {
        switch self {
        case .sevenCard: return "1. 7카드"
        case .fiveCard: return "2. 5카드"
        case .unknown:  return "잘못된 입력: 다시 입력해주세요"
        }
    }
    
    /// the number of card for one turn
    var numberOfCardForOneTurn: Int {
        switch self {
        case .sevenCard: return 7
        case .fiveCard: return 5
        case .unknown:  return 0
        }
    }
}
