//
//  OutputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    private func printCard(with trump: CardFormat) {
        print("\(trump.description())")
    }
    
    func printReset(by deck: DeckFormat) {
        print("카드 전체를 초기화했습니다.")
        print("총 \(deck.count())장의 카드가 있습니다.\n")
    }
    
    func printShuffle(by deck: DeckFormat) {
        print("총 \(deck.count())장의 카드를 섞었습니다.\n")
    }
    
    func printRemoveOne(by deck: DeckFormat, _ trump: CardFormat) {
        printCard(with: trump)
        print("총 \(deck.count())장의 카드가 남았습니다.\n")
    }
}
