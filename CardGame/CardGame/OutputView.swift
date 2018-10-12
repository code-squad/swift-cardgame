//
//  OutputView.swift
//  CardGame
//
//  Created by 이동건 on 21/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func display(_ error: CardGameError) {
        print("\(error)")
    }
    
    static func display(_ values: CardGameResult) {
        print(convert(from: values))
    }
    
    static private func convert(from type: CardGameResult) -> String {
        switch type {
        case .reset(let count):
            return """
            카드 전체를 초기화했습니다.
            총 \(count)장의 카드가 있습니다.
            """
        case .shuffle(let count):
            return "전체 \(count)장의 카드를 섞었습니다."
        case .pick(let card, let remains):
            return """
            \(card)
            총 \(remains)장의 카드가 남았습니다.
            """
        case .group(let group):
            let result = group.display { (group) -> (String) in
                var text = ""
                group.forEach {
                    text += "\($0)\n"
                }
                return text
            }
            return result
        }
    }
    
}
