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

let subscriber = PockerGameOuputView()
let dealer = PockerGameDealer(pockerGameType: pockerGameType)
let registry = PockerPlayerRegistry(dealer:dealer, numberOfPlayers: numberOfPlayers)
let game = PockerGame(registry: registry, subscriber: subscriber)
dealer.assign(game: game)

let organizer = PockerGameOrganizer(dealer: dealer, receiver: game)
organizer.play()




