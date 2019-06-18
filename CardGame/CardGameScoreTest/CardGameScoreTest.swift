//
//  CardGameScoreTest.swift
//  CardGameScoreTest
//
//  Created by hw on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameScoreTest: XCTestCase {
    var playerList : [GamePlayer] = []
    override func setUp() {
        let cardDeck : CardDeck = CardDeck.init()
        var input: String
        var selectedGameType: GameType = GameType.sevenCard
        var numberOfPlayers: Int = 3
        // 처리
        playerList = buildPlayersList(num: numberOfPlayers)
        playerList = try! fillDeckOfPlayers(players: playerList, deck: cardDeck, type: selectedGameType).get()
    }
    func testExample() {
        var result = CardGameResult(playerList[0])
        result.sortPlayerCardDeck()
        
    }

//    func sortPlayerCardDeck() {
//        //        for player in self.playerList {
//        player.sortMyDeck()
//        print("\(player)")
//        //        }
//    }
//    
//    private func calculateScores(){
//        //        for (index, player) in playerList.enumerated(){
//        scores = calculateEachPlayerHand(player)
//        //        }
//    }
//    
    private func calculateEachPlayerHand(_ player: GamePlayer) -> Int{
        var maxScore = player.myCardDeck[player.myCardDeck.count-1].number.rawValue * CardScore.highCard.rawValue
        
        return maxScore
    }
    
    func onePairCheck(_ deck: [Card]) -> Int {
        var onePairScore = 0
        var count = 0
        for index in deck.startIndex..<deck.endIndex {
            print(index)
        }
        
        return onePairScore * CardScore.onePair.rawValue
    }
    ///
    private func buildPlayersList(num numbers: Int) -> [GamePlayer] {
        var playerList = [GamePlayer]()
        for index in 1..<(numbers+1) {
            let player = GamePlayer("\(PlayerType.participant.description)\(index)")
            playerList.append(player)
        }
        let player = GamePlayer("\(PlayerType.dealer.description)")
        playerList.append(player)
        return playerList
    }
    
    private func fillDeckOfPlayers(players: [GamePlayer], deck : CardDeck, type: GameType) -> Result<[GamePlayer], DrawCardError>{
        if !isValidGame(deck: deck, numberOfPlayers: players.count, distributionSize: type.rawValue) {
            return .failure(DrawCardError.notEnoughCardInDeck)
        }
        deck.shuffle()
        for _ in 0..<type.rawValue {
            distributeCardsByGameRule(players: players, deck: deck)
        }
        return .success(players)
    }
    
    private func distributeCardsByGameRule(players: [GamePlayer], deck: CardDeck) {
        for player in players {
            let drewCard = try! deck.removeOne().get()
            player.addMyCard(drewCard)
        }
    }
    private func isValidGame(deck : CardDeck, numberOfPlayers: Int, distributionSize: Int) -> Bool {
        if deck.deckSize < numberOfPlayers * distributionSize {
            return false
        }
        return true
    }
    
}
