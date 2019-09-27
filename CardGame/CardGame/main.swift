//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let player = PockerPlayer(name: "Jake")
let subscriber = PockerGameOuputView()

let game = PockerGame(players: [player], subscriber: subscriber)

let reader = UserInputReader()
let commander = PockerGameCommander(reader: reader)
let organizer = PockerGameOrganizer(commander: commander, receiver: game)

while true {
    organizer.play()
}

