//
/******************************************************************************
 * File Name        : Suit.swift
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

enum Suit: Int, CaseIterable {
    case spade = 1
    case heart = 2
    case diamond = 3
    case clover = 4
    
    var description: String {
        switch self {
        case .spade:
            return "♠️"
        case .heart:
            return "❤️"
        case .diamond:
            return "♦️"
        case .clover:
            return "♣️"
        }
    }
}
