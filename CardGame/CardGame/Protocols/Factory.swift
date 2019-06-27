//
//  Factory.swift
//  CardGame
//
//  Created by 이동영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Factory {
    associatedtype IN
    associatedtype OUT
    
   static func create(_ input: IN) -> OUT?
}
