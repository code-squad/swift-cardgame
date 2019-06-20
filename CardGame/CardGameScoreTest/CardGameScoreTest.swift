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
    
    func testSortPlayerDeck() {
        var result = CardGameResult(playerList[0])
        result.sortPlayerCardDeck()
        for index in 0..<playerList[0].myCardDeck.count-1 {
            XCTAssert(playerList[0].myCardDeck[index].number.rawValue <= playerList[0].myCardDeck[index+1].number.rawValue,
                      "fail to ascending order deck")
        }
    }
    
    func testCalculatePlayerScore() {
        var result = CardGameResult(playerList[0])
        result.sortPlayerCardDeck()
        for index in 0..<playerList[0].myCardDeck.count-1 {
            XCTAssert(playerList[0].myCardDeck[index].number.rawValue <= playerList[0].myCardDeck[index+1].number.rawValue,
                      "fail to ascending order deck")
        }
        let score = calculateEachPlayerHand(playerList[0])
        print(playerList[0].myCardDeck)
        if score < CardScore.onePair.rawValue {
            print(" high Card : \(score)")
        }else if score < CardScore.twoPair.rawValue {
            print(" one Pair : \(score/CardScore.onePair.rawValue)")
        }else if score < CardScore.triple.rawValue {
            print(" two Pair : \(score/CardScore.twoPair.rawValue)")
        }else if score < CardScore.straight.rawValue {
            print(" triple : \(score/CardScore.triple.rawValue)")
        }else if (score < CardScore.fourCard.rawValue) {
            print(" straight : \(score/CardScore.straight.rawValue)")
        }else {
            print(" four card : \(score/CardScore.fourCard.rawValue)")
        }
    }
    
    func testDecideWinner(){
        var result = CardGameResult(playerList[0])

    }

    private func prepareTriplePlayer( ) -> GamePlayer {
        //        [☘5, 🔶6, ☘6, ♥️6, ♠️7, ♥️9, ☘10]
        let card1 = Card(type: CardType.clover, number: CardNumber.five)
        let card2 = Card(type: CardType.diamond, number: CardNumber.six)
        let card3 = Card(type: CardType.clover, number: CardNumber.six)
        let card4 = Card(type: CardType.heart, number: CardNumber.six)
        let card5 = Card(type: CardType.spade, number: CardNumber.seven)
        let card6 = Card(type: CardType.heart, number: CardNumber.nine)
        let card7 = Card(type: CardType.clover, number: CardNumber.ten)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    private func prepareQuadruplePlayer( ) -> GamePlayer {
        //        [☘5, 🔶6, ☘6, ♥️6, ♠️7, ♥️9, ☘10]
        let card1 = Card(type: CardType.clover, number: CardNumber.five)
        let card2 = Card(type: CardType.diamond, number: CardNumber.six)
        let card3 = Card(type: CardType.clover, number: CardNumber.six)
        let card4 = Card(type: CardType.heart, number: CardNumber.six)
        let card5 = Card(type: CardType.spade, number: CardNumber.six)
        let card6 = Card(type: CardType.heart, number: CardNumber.nine)
        let card7 = Card(type: CardType.clover, number: CardNumber.ten)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    private func prepareOnePairPlayer() -> GamePlayer {
        //[☘3, ☘5, ♥️6, ♥️7, ♠️7, ☘9, ♠️J]
        let card1 = Card(type: CardType.clover, number: CardNumber.three)
        let card2 = Card(type: CardType.clover, number: CardNumber.five)
        let card3 = Card(type: CardType.heart, number: CardNumber.six)
        let card4 = Card(type: CardType.heart, number: CardNumber.seven)
        let card5 = Card(type: CardType.spade, number: CardNumber.seven)
        let card6 = Card(type: CardType.clover, number: CardNumber.nine)
        let card7 = Card(type: CardType.spade, number: CardNumber.jack)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    private func prepareTwoPairPlayer() -> GamePlayer {
        //[☘3, ☘5, ♥️6, ♥️7, ♠️7, ☘J, ♠️J]
        let card1 = Card(type: CardType.clover, number: CardNumber.three)
        let card2 = Card(type: CardType.clover, number: CardNumber.five)
        let card3 = Card(type: CardType.heart, number: CardNumber.six)
        let card4 = Card(type: CardType.heart, number: CardNumber.seven)
        let card5 = Card(type: CardType.spade, number: CardNumber.seven)
        let card6 = Card(type: CardType.clover, number: CardNumber.jack)
        let card7 = Card(type: CardType.spade, number: CardNumber.jack)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    private func prepareMaxStraightPlayer() -> GamePlayer {
        //[☘3, ☘9, ♥️10, ♥️J, ♠️Q, ☘K, ♠️ACE]
        let card1 = Card(type: CardType.clover, number: CardNumber.three)
        let card2 = Card(type: CardType.clover, number: CardNumber.nine)
        let card3 = Card(type: CardType.heart, number: CardNumber.ten)
        let card4 = Card(type: CardType.heart, number: CardNumber.jack)
        let card5 = Card(type: CardType.spade, number: CardNumber.queen)
        let card6 = Card(type: CardType.clover, number: CardNumber.king)
        let card7 = Card(type: CardType.spade, number: CardNumber.ace)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    private func prepareMinStraightPlayer() -> GamePlayer {
        //[☘3, ☘9, ♥️2, ♥️3, ♠️4, ☘5, ♠️ACE]
        let card1 = Card(type: CardType.clover, number: CardNumber.three)
        let card2 = Card(type: CardType.clover, number: CardNumber.nine)
        let card3 = Card(type: CardType.heart, number: CardNumber.two)
        let card4 = Card(type: CardType.heart, number: CardNumber.three)
        let card5 = Card(type: CardType.spade, number: CardNumber.four)
        let card6 = Card(type: CardType.clover, number: CardNumber.five)
        let card7 = Card(type: CardType.spade, number: CardNumber.ace)
        let player: GamePlayer = GamePlayer()
        player.addMyCard(card1)
        player.addMyCard(card2)
        player.addMyCard(card3)
        player.addMyCard(card4)
        player.addMyCard(card5)
        player.addMyCard(card6)
        player.addMyCard(card7)
        return player
    }
    
    func testCalculateOnePair(){
        let player = prepareOnePairPlayer()
        guard let result = getOrderedHandSet(player) else {
            return
        }
        let score = getOnePairScore(result)
        XCTAssert(score == 20*7, "one Pair Test fail")
    }

    func testCalculateTwoPair(){
        let player = prepareTwoPairPlayer()
        guard let result = getOrderedHandSet(player) else {
            return
        }
        let score = getTwoPairScore(result)
        XCTAssert(score == (200*11), "one Pair Test fail")
    }

    func testCalculateTriple(){
        let player = prepareTriplePlayer()
        guard let result = getOrderedHandSet(player) else {
            return
        }
        let score = getTriplePairScore(result)
        XCTAssert(score == (2000*6), "Triple Test fail")
    }

    func testCalculateQuadruple(){
        let player = prepareQuadruplePlayer()
        guard let result = getOrderedHandSet(player) else {
            return
        }
        let score = getFourCardScore(result)
        XCTAssert(score == 200_000*6, "Triple Test fail")
    }
    
    func testCalculateMaxStraight(){
        let player = prepareMaxStraightPlayer()
        guard let result = getOrderedHandSet(player) else{
            return
        }
        let score = getStraightScore(result)
        XCTAssert(score == 20_000*14, "Straight Test fail, score : \(score)")
    }
    
    func testCalculateMinStraight(){
        let player = prepareMinStraightPlayer()
        guard let result = getOrderedHandSet(player) else{
            return
        }
        let score = getStraightScore(result)
        XCTAssert(score == 20_000*5, "Straight Test fail, score : \(score)")
    }
    
    typealias handSet =  [(key: Int, value: [CardType])]
    
    private func getOrderedHandSet (_ player : GamePlayer) -> handSet? {
        guard let playerScoreDictionary = buildDeckDictionary(player) else{
            return nil
        }
        let result = playerScoreDictionary.sorted(by: { ( pair1, pair2) -> Bool in
            return pair1.key < pair2.key
        })
        return result
    }
    
    private func getOnePairScore(_ result: handSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: 2)
        let handValue = onePairNumber * CardScore.onePair.rawValue
        return handValue
    }

    private func getTwoPairScore(_ result: handSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: 2)
        let twoPairNumber = getTwoPairNumber(result: result, coefficient: 2, prevNumber: onePairNumber)
        var handValue = 0
        if onePairNumber == 0 {
            return handValue
        }
        handValue = twoPairNumber == 0 ? (onePairNumber * CardScore.onePair.rawValue): (onePairNumber * CardScore.twoPair.rawValue)
        return handValue
    }
    
    private func getTriplePairScore(_ result : handSet) -> Int {
        let tripleNumber = getMultipleNumber(result, coefficient: 3)
        let handValue = tripleNumber * CardScore.triple.rawValue
        return handValue
    }
    
    private func getStraightScore(_ result: handSet) -> Int {
        let straightNumber = getStraightNumber(handSet: result, count: 5)
        let handValue = straightNumber * CardScore.straight.rawValue
        return handValue
    }
    
    private func getFourCardScore(_ result: handSet) -> Int {
        let quardNumber = getMultipleNumber(result, coefficient: 4)
        let handValue = quardNumber * CardScore.fourCard.rawValue
        return handValue
    }
    
    //start from : 14(ACE) 13 12 11 10 9 8 7 6 5
    private func getStraightNumber(handSet: handSet, count: Int) -> Int {
        var number = 0
        for element in stride(from: handSet.endIndex-1, through: handSet.startIndex+3, by: -1){
            if element > handSet.startIndex+3 && handSet[element].value.count > 0 {
                if isStraight(handSet: handSet, from: element) {
                    number = handSet[element].key
                    break
                }
            }
            if element == handSet.startIndex+3 && isMinimalStraight(handSet: handSet, from: element){
                number = handSet[element].key
                break
            }
        }
        return number
    }
    
    private func isMinimalStraight(handSet: handSet, from : Int) -> Bool {
        var count = 1
        if (handSet[handSet.endIndex-1].value.count == 0){  //ACE 보유 체크
            return false
        }
        for element in handSet.startIndex..<(from){
            count += (handSet[element].value.count > 0) ? 1: 0
        }
        let result = count == 4 ? true : false
        return result
    }
    
    private func isStraight(handSet: handSet, from: Int) -> Bool{
        var count = 0
        for element in from-4..<(from){
            count += (handSet[element].value.count > 0) ? 1 : 0
        }
        let result = count == 4 ? true : false
        return result
    }
    
    private func getTwoPairNumber(result: handSet, coefficient: Int = 2, prevNumber: Int ) -> Int {
        var number = 0
        for element in stride(from: result.endIndex-1, through: result.startIndex, by: -1) {
            if result[element].key == prevNumber {
                continue
            }
            if result[element].value.count == coefficient {
                number = result[element].key
                break
            }
        }
        return number
    }
    private func getMultipleNumber (_ result: handSet, coefficient: Int)-> Int {
        var number = 0
        for element in stride(from: result.endIndex-1, through: result.startIndex, by: -1) {
            if result[element].value.count == coefficient {
                number = result[element].key
                break
            }
        }
        return number
    }
    
    private func calculateEachPlayerHand(_ player: GamePlayer) -> Int{
        //highScore
        var maxScore = player.myCardDeck[player.myCardDeck.count-1].number.rawValue * CardScore.highCard.rawValue
        guard let orderedHandSet = getOrderedHandSet(player) else{
            return maxScore
        }
        
        let onePair = getOnePairScore(orderedHandSet)
        let twoPair = getTwoPairScore(orderedHandSet)
        let triple = getTwoPairScore(orderedHandSet)
        let straight = getTriplePairScore(orderedHandSet)
        let quadruple = getFourCardScore(orderedHandSet)
        
        maxScore = maxScore > onePair ? maxScore : onePair
        maxScore = maxScore > twoPair ? maxScore : twoPair
        maxScore = maxScore > triple ? maxScore : triple
        maxScore = maxScore > straight ? maxScore : straight
        maxScore = maxScore > quadruple ? maxScore : quadruple
        return maxScore
    }
    
    private func buildDeckDictionary(_ player: GamePlayer) -> [ Int : [CardType]]? {
        var dictionary = initializeDictionary()
        for card in player.myCardDeck {
            let number = card.number.rawValue
            guard var eachType = dictionary[number] else {
                break
            }
            eachType.append(card.type)
            dictionary.updateValue(eachType, forKey: number)
        }
        return dictionary
    }
    
    private func initializeDictionary () -> [Int : [CardType]] {
        var dictionary = [Int : [CardType]]()
        for index in CardNumber.two.rawValue..<CardNumber.ace.rawValue+1 {
            dictionary.updateValue([CardType](), forKey: index)
        }
        return dictionary
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
