//
//  InputView.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol MenuDescription: RawRepresentable {
    static var menu: String { get }
}

enum GameCategory: String, MenuDescription {
    static var menu: String {
        return "카드 게임 종류를 선택하세요.\n1.7카드\n2.5카드\n> "
    }
    
    static var minimumRequired: Int {
        return GameCategory.five.count * 2
    }
    
    var count: Int {
        switch self {
        case .seven:
            return 7
        case .five:
            return 5
        }
    }
    case seven = "1"
    case five = "2"
}

enum GamePlayerCategory: String, MenuDescription {
    static var menu: String {
        return "참여할 사람의 인원을 입력하세요.\n> "
    }
    var count: Int {
        return Int(self.rawValue)!
    }
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
}

enum MenuCategory: String, MenuDescription {
    static var menu: String {
        return "다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2.카드 섞기\n3.카드 하나 뽑기\n> "
    }
    case reset = "1"
    case shuffle = "2"
    case pick = "3"
}

struct InputView<T: MenuDescription> where T.RawValue == String {
    
    static func read() throws -> T {
        print(T.menu, terminator: "")
        let picked = readLine() ?? ""
        if let menu = T(rawValue: picked) {
            return menu
        }
        throw CardGameError.invalidMenu
    }
}
