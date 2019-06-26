//
//  InputView.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    enum Menu: CaseIterable, CustomStringConvertible {
        var description: String {
            switch self {
            case .reset:
                return "1. 카드 초기화"
            case .shuffle:
                return "2. 카드 섞기"
            case .draw:
                return "3. 카드 하나 뽑기"
            }
        }
        
        case reset
        case shuffle
        case draw
    }
    
    static func run() -> String {
        showMenu()
        return fetchInput()
    }
    
    static private func showMenu(){
        print("다음 메뉴를 선택해주세요.")
        Menu.allCases.forEach{
            print($0.description)
        }
        print(">", terminator: " ")
    }
    
    static private func fetchInput() -> String {
        return readLine() ?? ""
    }

}
