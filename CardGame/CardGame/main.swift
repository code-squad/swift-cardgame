//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    do {
        let input = try InputView.ask(for: .request)
    } catch {
        print(error.localizedDescription)
    }
}

main()
