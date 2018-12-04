//
//  OutputView.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResetText(in count : Int) {
        print("카드 전체를 초기화했습니다.")
        print("총 \(count)의 카드가 있습니다.")
    }
    
    static func printShuffleText(in count : Int) {
        print("전체 \(count)장의 카드를 섞었습니다.")
    }
    
    static func printPickText(in count : Int, with card : Card?) {
        guard let card = card else {
            print("카드 덱에 카드가 없습니다.")
            return
        }
        print("\(card)")
        print("총 \(count)의 카드가 남아있습니다.")
    }
}


