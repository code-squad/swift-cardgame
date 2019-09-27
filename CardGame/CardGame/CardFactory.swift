//
//  CardFactory.swift
//  CardGame
//
//  Created by RENO1 on 26/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardFactory: CardFactoryProtocol {
    func createCard(integerTuple: (Int,Int)) -> Card {
        return createCard(shapeInteger: integerTuple.0, NumberInteger: integerTuple.1)
    }
    
    func createCard(shapeInteger: Int, NumberInteger: Int) -> Card {
        let shape = integerToShape(shapeInteger: shapeInteger)
        let number = integerToCardNumber(numberInteger: NumberInteger)
        return Card(shape: shape, cardNumber: number)
    }
    
    private func integerToShape(shapeInteger:Int) -> Shape {
        switch shapeInteger % 4 {
        case 0:
            return Shape.Spades
        case 1:
            return Shape.Clubs
        case 2:
            return Shape.Hearts
        case 3:
            return  Shape.Diamonds
        default:
            return Shape.Spades
        }
    }
    
    private func integerToCardNumber(numberInteger:Int) -> String {
        switch numberInteger % 13 + 1 {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(numberInteger)
        }
    }
    
}

protocol CardFactoryProtocol {
    func createCard(shapeInteger:Int, NumberInteger:Int) -> Card
    func createCard(integerTuple: (Int,Int)) -> Card
}
