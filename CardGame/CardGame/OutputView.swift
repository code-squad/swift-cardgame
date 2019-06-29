//
//  OutputView.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func printGameResult(dealer: OutputViewPrintable) {
        dealer.printGameResult (handler:
            { result in
                print(result)
        })
    }
}
