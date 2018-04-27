//
//  CardStackPrintable.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardStackPrintable {
    
    func printCardStack(_ handler: (_ cards : [Card]) -> Void  )
    
}
