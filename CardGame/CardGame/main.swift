//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run(){
    // inputview
    let inputView = InputView()
    let numberOfMenu = inputView.printMenu()
    
    // outputview
    let outputView = OutputView()
    outputView.printResult(numberOfMenu: numberOfMenu)
    
    
    
}
run()
