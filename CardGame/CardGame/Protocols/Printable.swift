//
//  Printable.swift
//  CardGame
//
//  Created by 이동영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PrintableOne {
    
    func print(logic: @escaping (String) -> Void)
}

protocol PrintableTwo {
    
    func print(logic: @escaping (String, String) -> Void, input: String)
}
