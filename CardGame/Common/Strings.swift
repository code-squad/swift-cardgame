//
//  Strings.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//
import Foundation
enum CARDGAME {
    
    enum MENU: String {
        case ASK
        case RESET = "1"
        case SHUFFLE = "2"
        case DRAW = "3"
        
        var desription: String {
            switch self {
                case .ASK:
                    return "다음 메뉴를 선택해주세요."
                case .RESET:
                    return "1. 카드 초기화"
                case .SHUFFLE:
                    return "2. 카드 섞기"
                case .DRAW:
                    return "3. 카드 하나 뽑기"
            }
        }
    }
    
    enum ERROR: Swift.Error {
        case isNil
        case isOrder
        case unExpected
        
        var desription: String {
            switch self {
                case .isNil:
                    return "선택한 값이 없습니다."
                case .isOrder:
                    return "잘 못 된 주문입니다."
                case .unExpected:
                    return "unExpected Error"
            }
        }
    }
}

enum GAMEMENU: String {
    case RESET = "카드 전체를 초기화 했습니다."
    
    enum DRAW {
        case TotalCommand
        case BackCommand
        
        var desription: String {
            switch self {
                case .TotalCommand:
                    return "총"
                case .BackCommand:
                    return "장의 카드를 섞었습니다."
            }
        }
    }
    
    enum SHUFFLE {
        case TotalCommand
        case BackCommand
        
        var desription: String {
            switch self {
                case .TotalCommand:
                    return "전체"
                case .BackCommand:
                    return "의 카드가 남았습니다."
            }
        }
    }
}
