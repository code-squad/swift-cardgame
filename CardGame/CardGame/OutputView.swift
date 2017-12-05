//
//  OutputView.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct OutputView {

    func showCardPacks(cardPacks: Array<CardPack>) {
        for cardPack in cardPacks {
            print(cardPack)
        }
    }

}
