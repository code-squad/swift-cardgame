//
//  InputView.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static func askQuestions() -> Inquiry? {
        print("다음 메뉴를 선택해주세요.")
        for question in Inquiry.allCases {
            print(question.selection)
        }
        do {
            return try Parser.parse(readLine() ?? "")
        } catch {
            print("error")
            return nil
        }
        
    }
}
