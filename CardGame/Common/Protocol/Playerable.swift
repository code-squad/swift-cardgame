//
//  Playerable.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 6. 3..
//  Copyright © 2018년 JK. All rights reserved.
//

protocol Playerable {
    func receiveCard(_ card: Card)
    func showMyCard() -> [Card]
    func showPlayer(_ handler: (Playerable) -> Void)
    func resetMyCard()
}
