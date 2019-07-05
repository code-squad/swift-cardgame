//
//  OutputViewPrintable.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ())
}
