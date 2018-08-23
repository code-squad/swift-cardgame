//
//  InputView.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MenuCategory: String {
    var description: String {
        switch self {
        case .reset:
            return "1. 카드 초기화\n"
        case .shuffle:
            return "2. 카드 섞기\n"
        case .pick:
            return "3. 카드 하나 뽑기"
        }
    }
    case reset = "1"
    case shuffle = "2"
    case pick = "3"
}

struct InputView {
    static private var menuDiscriptions: String {
        var menus = ""
        menus += MenuCategory.reset.description
        menus += MenuCategory.shuffle.description
        menus += MenuCategory.pick.description
        return menus
    }
    
    static func read() throws -> MenuCategory {
        print(menuDiscriptions)
        print("> ", terminator: "")
        let picked = readLine() ?? ""
        if let menu = MenuCategory(rawValue: picked) {
            return menu
        }
        throw CardGameError.invalidMenu
    }
}
