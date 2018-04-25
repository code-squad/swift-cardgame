//
//  OutputPrintable.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol OutputPrintable {
    func printMenu()
    func printReset(_ resetCard: [Card])
    func printShuffle(_ shuffleCard: [Card])
    func printRemoveOne(_ basic: [Card],_ pick: Card)
    func printinValid()
}
