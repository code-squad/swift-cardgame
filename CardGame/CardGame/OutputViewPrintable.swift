//
//  OutputViewPrintable.swift
//  CardGame
//
//  Created by 이진영 on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol OutputViewPrintable {
    func printPlayerInformation(handler: @escaping (String, [Card]) -> ())
}
