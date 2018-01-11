//
//  OutputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {
    
    enum programDescription: CustomStringConvertible {
        case chooseMenu
        case emptyInput
        case wrongInput
        case quitGame
        
        var description: String {
            switch self {
            case .chooseMenu:
                return "다음 메뉴를 선택해주세요.\n 1. 카드 초기화\n 2. 카드 섞기\n 3. 카드 하나 뽑기\n"
            case .emptyInput:
                return "=== 번호를 입력하지 않았습니다. 게임 메뉴를 선택해주세요. ===\n"
            case .wrongInput:
                return "=== 잘못 입력하셨습니다. 다시 입력해주세요. ===\n"
            case .quitGame:
                return "=== 게임 종료 ==="
            }
        }
    }
    
    func showCard(cardToPrint: Card) {
        print(cardToPrint)
    }
    
    func resultMessage(text: String) {
        print(text)
    }
}

