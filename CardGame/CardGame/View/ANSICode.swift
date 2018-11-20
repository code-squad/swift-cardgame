//
//  ANSICode.swift
//  HelloSwift
//
//  Created by JK on 07/08/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

//https://en.wikipedia.org/wiki/ANSI_escape_code
public struct ANSICode {
    static let escape   = "\u{001B}["
    static let clear    = "\(escape)2J"
    static let home     = "\(escape)0;0H"
    static let none     = "\(escape)0;0m\(escape)1;0m"

    struct text {
        static let black   = escape + "0;30m"
        static let red     = escape + "0;31m"
        static let green   = escape + "0;32m"
        static let yellow  = escape + "0;33m"
        static let blue    = escape + "0;34m"
        static let magenta = escape + "0;35m"
        static let cyan    = escape + "0;36m"
        static let white   = escape + "0;37m"
        static let normal  = escape + "0;39m"
        static let blackBright   = escape + "1;30m"
        static let redBright     = escape + "1;31m"
        static let greenBright   = escape + "1;32m"
        static let yellowBright  = escape + "1;33m"
        static let blueBright    = escape + "1;34m"
        static let magentaBright = escape + "1;35m"
        static let cyanBright    = escape + "1;36m"
        static let whiteBright   = escape + "1;37m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)38;2;\(R);\(G);\(B)m"
        }
    }

    struct bgText {
        static let red     = escape + "0;41m"
        static let green   = escape + "0;42m"
        static let yellow  = escape + "0;43m"
        static let blue    = escape + "0;44m"
        static let magenta = escape + "0;45m"
        static let cyan    = escape + "0;46m"
        static let white   = escape + "0;47m"
        static let normal  = escape + "0;49m"
        static let redBright     = escape + "1;41m"
        static let greenBright   = escape + "1;42m"
        static let yellowBright  = escape + "1;43m"
        static let blueBright    = escape + "1;44m"
        static let magentaBright = escape + "1;45m"
        static let cyanBright    = escape + "1;46m"
        static let whiteBright   = escape + "1;47m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)48;2;\(R);\(G);\(B)m"
        }
    }

    struct cursor {
        static func move(row : Int, col : Int) -> String {
            return "\(escape)\(row);\(col)f"
        }
    }
}
