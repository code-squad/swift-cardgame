//
//  CardGame.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class MyCardGame {
    
    func printRandomCard(shape: CardData.Shape, number: CardData.Number){
        let cardData = CardData(shape: shape, number: number)
        print(cardData.shape, cardData.number)
    }
   
}
