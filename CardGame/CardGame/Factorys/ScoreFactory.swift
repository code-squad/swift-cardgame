//
//  ScoreFactory.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ScoreFactory: Factory {
    typealias IN = [Card]
    typealias OUT = Score
    
    static func create(_ input: [Card]) -> Score? {
        return .fourCard(top: input[0])
    }
    
    static func createHighCard(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createOnePair(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createTwoPair(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createTrips(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createStright(_ cards: [Card]) -> Score? {
        return nil
    }
    
    static func createFourCard(_ cards: [Card]) -> Score? {
        return nil
    }
    
}
