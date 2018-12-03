//
//  OutputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printCard(with trump: CardFormat) {
        guard let suits = trump.extractSuits(), let rank = trump.extractRank() else {
            print("예상하지 못한 오류가 발생했습니다")
            return
        }

        print("\(suits.description)\(rank.description)")
    }
}
