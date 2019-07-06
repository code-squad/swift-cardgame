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
    
    static func read(message: String) -> String {
        print(message)
        return readLine() ?? ""
    }
   
}
