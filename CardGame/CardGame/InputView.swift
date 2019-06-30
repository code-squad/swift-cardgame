//
//  InputView.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Message: CustomStringConvertible {
        case selectMenu
        
        var description: String {
            switch self {
            case .selectMenu:
                return """
                다음 메뉴를 선택해주세요.
                1. 카드 초기화
                2. 카드 섞기
                3. 카드 하나 뽑기
                """
            }
        }
    }
    
    enum Error: Swift.Error {
        case invalidMenuNumber
        
        var localizedDescription: String {
            switch self {
            case .invalidMenuNumber:
                return "유효하지 않은 메뉴 번호입니다."
            }
        }
    }
    
    static private func readData(message: Message) -> String {
        print(message)
        return readLine() ?? ""
    }
    
    static func readMenu() throws -> GameMenu {
        let menuNumber = readData(message: .selectMenu)
        if let gameMenu = GameMenu(rawValue: menuNumber) {
            return gameMenu
        }
        throw Error.invalidMenuNumber
    }
}
