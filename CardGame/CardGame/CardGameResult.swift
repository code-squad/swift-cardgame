//
//  CardGameResult.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

private typealias HandSet =  [(key: Int, value: [CardType])]
private typealias CardScoreSet = (one: Int, two: Int, triple: Int, straight: Int, quad: Int )
private typealias GameWinner = (name: String, winScore: Int)

class CardGameResult {
    private var playerList : [GamePlayer]
    private var scores: [Int]
    
    init(_ players: [GamePlayer]){
        self.playerList = players
        scores = [Int].init(repeating: 0, count: players.count)
        sortPlayerCardDeck()
        calculateScores()
    }
    
    private func sortPlayerCardDeck() {
        for player in self.playerList {
            player.sortOwnDeck()
        }
    }
    
    func selectWinnerName() -> String {
        var currentMaxScore = scores[0]
        var currentIndex = 0
        for index in 1..<scores.endIndex{
            if currentMaxScore < scores[index] {
                currentMaxScore = scores[index]
                currentIndex = index
            }
        }
        return playerList[currentIndex].name
    }
    
    private func calculateScores(){
        for (index, player) in playerList.enumerated(){
            scores[index] = calculateEachPlayerHand(player)
        }
    }
    
    private func calculateEachPlayerHand(_ player: GamePlayer) -> Int{
        var maxScore = player.myCardDeck[player.myCardDeck.count-1].number.rawValue * CardScore.highCard.weightedValue
        guard let orderedHandSet = getOrderedHandSet(player) else{
            return maxScore
        }
        let onePair = getOnePairScore(orderedHandSet)
        let twoPair = getTwoPairScore(orderedHandSet)
        let triple = getTwoPairScore(orderedHandSet)
        let straight = getTriplePairScore(orderedHandSet)
        let quadruple = getFourCardScore(orderedHandSet)
        let cardScoreSet: CardScoreSet = CardScoreSet(onePair, twoPair, triple, straight, quadruple)
        maxScore = compareCardScores(currentMax: maxScore, scoreSet: cardScoreSet)
        return maxScore
    }
    
    private func compareCardScores (currentMax: Int, scoreSet: CardScoreSet ) -> Int {
        var maxScore = currentMax
        maxScore = maxScore > scoreSet.one ? maxScore : scoreSet.one
        maxScore = maxScore > scoreSet.two ? maxScore : scoreSet.two
        maxScore = maxScore > scoreSet.triple ? maxScore : scoreSet.triple
        maxScore = maxScore > scoreSet.straight ? maxScore : scoreSet.straight
        maxScore = maxScore > scoreSet.quad ? maxScore : scoreSet.quad
        return maxScore
    }
    private func getOrderedHandSet (_ player : GamePlayer) -> HandSet? {
        guard let playerScoreDictionary = buildDeckDictionary(player) else{
            return nil
        }
        let result = playerScoreDictionary.sorted(by: { ( pair1, pair2) -> Bool in
            return pair1.key < pair2.key
        })
        return result
    }
    
    private func getOnePairScore(_ result: HandSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: CardScore.onePair.rawValue)
        let handValue = onePairNumber * CardScore.onePair.weightedValue
        return handValue
    }
    
    private func getTwoPairScore(_ result: HandSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: CardScore.onePair.rawValue)
        let twoPairNumber = getTwoPairNumber(result: result, coefficient: CardScore.onePair.rawValue, prevNumber: onePairNumber)
        var handValue = 0
        if onePairNumber == 0 {
            return handValue
        }
        handValue = twoPairNumber == 0 ? (onePairNumber * CardScore.onePair.weightedValue): (onePairNumber * CardScore.twoPair.weightedValue)
        return handValue
    }
    
    private func getTriplePairScore(_ result : HandSet) -> Int {
        let tripleNumber = getMultipleNumber(result, coefficient: CardScore.triple.rawValue)
        let handValue = tripleNumber * CardScore.triple.weightedValue
        return handValue
    }
    
    private func getStraightScore(_ result: HandSet) -> Int {
        let straightNumber = getStraightNumber(handSet: result, count: CardScore.straight.rawValue)
        let handValue = straightNumber * CardScore.straight.weightedValue
        return handValue
    }
    
    private func getFourCardScore(_ result: HandSet) -> Int {
        let quardNumber = getMultipleNumber(result, coefficient: CardScore.fourCard.rawValue)
        let handValue = quardNumber * CardScore.fourCard.weightedValue
        return handValue
    }
    
    //start from : 14(ACE) 13 12 11 10 9 8 7 6 5
    private func getStraightNumber(handSet: HandSet, count: Int) -> Int {
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
    
    private func isMinimalStraight(handSet: HandSet, from : Int) -> Bool {
        var count = 1
        if (handSet[handSet.endIndex-1].value.count == 0){
            return false
        }
        for element in handSet.startIndex..<(from+1){
            count += (handSet[element].value.count > 0) ? 1: 0
        }
        let result = count == CardScore.straight.rawValue ? true : false
        return result
    }
    
    private func isStraight(handSet: HandSet, from: Int) -> Bool{
        var count = 0
        for element in from-4..<(from+1){
            count += (handSet[element].value.count > 0) ? 1 : 0
        }
        let result = count == CardScore.straight.rawValue ? true : false
        return result
    }
    
    private func getTwoPairNumber(result: HandSet, coefficient: Int = 2, prevNumber: Int ) -> Int {
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
    private func getMultipleNumber (_ result: HandSet, coefficient: Int)-> Int {
        var number = 0
        for element in stride(from: result.endIndex-1, through: result.startIndex, by: -1) {
            if result[element].value.count == coefficient {
                number = result[element].key
                break
            }
        }
        return number
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
    
}
