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
        convert(from: values)
    }
    
    static private func convert(from type: CardGameResult) {
        switch type {
        case .reset(let count):
            print("카드 전체를 초기화했습니다.\n총 \(count)장의 카드가 있습니다.")
        case .shuffle(let count):
            print("전체 \(count)장의 카드를 섞었습니다.")
        case .pick(let card, let remains):
            print("\(card)\n총 \(remains)장의 카드가 남았습니다.")
        case .group(let group):
            group.display { (group) in
                group.forEach {
                    print($0)
                }
            }
        }
    }
    
}
