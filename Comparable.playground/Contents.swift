//: Playground - noun: a place where people can play

import UIKit

class CardDeck {

    enum Suit: String {
        case clover = "♣️"
        case diamond = "♦️"
        case heart = "♥️"
        case spade = "♠️"
    }

    enum Denomination: Int, CustomStringConvertible {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen

        var description: String {
            switch self {
            case .one: return "A"
            case .eleven: return "J"
            case .twelve: return "Q"
            case .thirteen: return "K"
            default: return String(self.rawValue)
            }
        }
    }

}

class Card: CustomStringConvertible {
    private(set) var suit: CardDeck.Suit
    private(set) var denomination: CardDeck.Denomination
    var description: String {
        return self.suit.rawValue + self.denomination.description
    }

    init(suit: CardDeck.Suit, denomination: CardDeck.Denomination) {
        self.suit = suit
        self.denomination = denomination
    }
}

if CardDeck.Suit.spade.hashValue < CardDeck.Suit.diamond.hashValue {
    print("스페이드가 더 크다")
} else {
    print("실패")
}

print(CardDeck.Suit.spade.hashValue)

let c1 = Card(suit: CardDeck.Suit.spade, denomination: CardDeck.Denomination.ten)
let c2 = Card(suit: CardDeck.Suit.spade, denomination: CardDeck.Denomination.seven)

func compare(card1: Card, card2: Card) -> Bool {
    if (card1.denomination.rawValue) > (card2.denomination.rawValue) {
        print("true")
        return true
    } else { print("false"); return false }
}

compare(card1:c1, card2:c2)

struct Contact {
    var name:String
    var phone:String
    init(name:String, phone:String) {
        self.name = name
        self.phone = phone
    }
}


let contacts = [
    Contact(name: "Rob",     phone: "555-1111"),
    Contact(name: "Richard", phone: "555-2222"),
    Contact(name: "Rachel",  phone: "555-1111"),
    Contact(name: "Loren",   phone: "555-2222"),
    Contact(name: "Mary",    phone: "555-3333"),
    Contact(name: "Susie",   phone: "555-2222")
]

let crossCheck = contacts.reduce(into: [String: [String]]()) { result, contact in
    result[contact.phone, default: []].append(contact.name)
}

/*
 crossCheck는 contacts를 [String: [String]]타입으로 변경한 결과
 contacts를 [String: [String]]타입으로 변경하는 로직은 클로저 내부에 있음
 클로저 내부의
 result는 'into: 타입'에서의 '타입'을 상징하는 매개변수
 contact는 contacts의 값(for contact in contacts할때의 하나의 value)
 result[contact.phone, default: []]는 result[key]를 상징히고, default:[]는 딕셔너리 value의 초기값
 append는 value값을 채워넣는 동작
 */


let crossReference = contacts.reduce(into: [String: [String]]()) {
    $0[$1.phone, default: []].append($1.name)
}


// let crossCheck = contacts.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Contact) throws -> Result##(Result, Contact) throws -> Result#>)
