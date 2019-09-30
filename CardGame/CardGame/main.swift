//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let userInputReader = UserInputReader()
let settingVeiw = PockerGameSettingView(reader: userInputReader)
let pockerGameType = settingVeiw.readGameType()
let numberOfPlayers = settingVeiw.readNumberOfPlayers()

let players = PockerPlayerRegistry.call(numberOfPlayers: numberOfPlayers)
let subscriber = PockerGameOuputView()
let game = PockerGame(players: players, subscriber: subscriber)

let commander = PockerGameCommander(pockerGameType: pockerGameType, gameStatusProvider: game)
let organizer = PockerGameOrganizer(commander: commander, receiver: game)

organizer.play()




