//
//  Card.swift
//  CardGame
//
//  Created by RENO1 on 25/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Card: CardProtocol, CustomStringConvertible {
    private let shape: Shape
    private let cardNumber: String
    
    var description: String {
        return "\(self.shape.rawValue)\(self.cardNumber)"
    }
    
    init(shape:Shape, cardNumber:String) {
        self.shape = shape
        self.cardNumber = cardNumber
    }
    
    func getShape() -> Shape {
        return self.shape
    }
    
    func getCardNumber() -> String {
        return self.cardNumber
    }
    
    
}

protocol CardProtocol {
    func getShape() -> Shape
    func getCardNumber() -> String
}

enum Shape:String {
    case Spades = "♠︎"
    case Clubs = "♣︎"
    case Hearts = "♥︎"
    case Diamonds = "♦︎"
}
