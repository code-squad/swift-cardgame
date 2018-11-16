//
//  OutputView.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {

    static func notify(error: Error) {
        guard let error = error as? GameErrorMessage else { return }
        print(error.message)
    }

    static func showCards(of cardGame: CardGame){
        print(cardGame.showCards())
    }

}
