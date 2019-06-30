//
//  InputView.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static private let gameMenuDescription = """
    \(GameMenu.initialize)
    \(GameMenu.shuffle)
    \(GameMenu.draw)
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
    
    static private func readData(message: String) -> String {
        print(message)
        return readLine() ?? ""
    }
    
    static func readMenu() throws -> GameMenu {
        let menuNumber = readData(message: gameMenuDescription)
        if let gameMenu = GameMenu(rawValue: menuNumber) {
            return gameMenu
        }
        throw Error.invalidMenuNumber
    }
}
