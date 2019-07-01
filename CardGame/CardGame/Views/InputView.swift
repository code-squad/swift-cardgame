//
//  InputView.swift
//  CardGame
//
//  Created by 이진영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private static let menu = "\(Menu.exit)\n\(Menu.reset)\n\(Menu.shuffle)\n\(Menu.draw)"
    
    static func readSelection() -> String {
        print(menu)
        
        let selection = readLine() ?? ""
        
        return selection
    }
}
