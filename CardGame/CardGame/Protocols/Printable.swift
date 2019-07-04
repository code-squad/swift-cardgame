//
//  Printable.swift
//  CardGame
//
//  Created by 이동영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Printable {
    
    func print(logic: @escaping (String) -> Void )
}

