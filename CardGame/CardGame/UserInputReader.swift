//
//  UserInputReader.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol InputReadable {
    func read() -> String
}

struct UserInputReader: InputReadable {
    func read() -> String {
        print("다음 메뉴를 선택해주세요.")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        return readLine() ?? ""
    }
}

