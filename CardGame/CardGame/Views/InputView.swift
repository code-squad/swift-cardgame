//
//  InputView.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static func input() -> Int? {
        showMenu()
        guard let index = Int(fetchInput()) else {
            return nil
        }
        return index
    }
    
    static private func showMenu(){
        let message = """
        다음 메뉴를 선택해주세요.
        1. 카드 초기화
        2. 카드 섞기
        3. 카드 하나 뽑기
        >
        """
        print(message, terminator: " ")
    }
    
    static private func fetchInput() -> String {
        return readLine() ?? ""
    }

}
