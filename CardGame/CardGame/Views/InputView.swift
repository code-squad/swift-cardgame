//
//  InputView.swift
//  CardGame
//
//  Created by JieunKim on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static private let guideSentence = """
    다음 메뉴를 선택해주세요.
    \(GameMenu.reset)
    \(GameMenu.shuffle)
    \(GameMenu.draw)
    >
    """
    
    enum Error: Swift.Error {
        case invalidMenuNumber
        
        var localizedDescription: String {
            switch self {
            case .invalidMenuNumber:
                return "유효하지 않은 메뉴 번호입니다."
            }
        }
    }
    
    static func read(message: String) -> String {
        print(message)
        return readLine() ?? ""
    }
    
    static func readMenu() throws -> GameMenu {
        let menuNumber = read(message: guideSentence)
        if let gameMenu = GameMenu(rawValue: menuNumber ) {
            return gameMenu
            
        }
        throw Error.invalidMenuNumber
    }
}
