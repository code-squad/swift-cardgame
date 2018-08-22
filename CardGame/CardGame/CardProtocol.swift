//
//  CardProtocol.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardProtocol {
    static var allCases:[CardProtocol] { get }
    static func pick() -> UnicodeScalar?
    static func random() -> CardProtocol
}

extension CardProtocol {
    static func corvertUnicode(_ str: CardProtocol) -> UnicodeScalar? {
        // char : unicodeScalar (♦)
        // char.value : UInt32 (9830)
        // unicodeScalarNumber : unicodeScalar (♦)
        var string = ""
        
        if let shape = str as? CardShape {
            string = shape.rawValue
        }
        
        if let number = str as? CardNumber {
            string = number.rawValue
        }
        
        let unicodeScalar = string.unicodeScalars.first
        if let unicodeNumber = unicodeScalar?.value {
            return UnicodeScalar(unicodeNumber)
        }
        return nil
    }
}
