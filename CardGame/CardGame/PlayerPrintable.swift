//
//  PlayerPrintable.swift
//  CardGame
//
//  Created by 이진영 on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PlayerPrintable {
    func getPlayerInformation(handler: @escaping (String, [Card]) -> ())
    func getWinnerName(handler: @escaping (String) -> ())
}
