// 요구사항
// 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계한다.
// 속성으로 모양 4개 중에 하나, 숫자 1-13개 중에 하나를 가질 수 있다.
// 모양이나 숫자도 적당한 데이터 구조로 표현한다. 클래스 혹은 Nested enum 타입으로 표현해도 된다.
// 어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
//어떤 처리가 간단해서, 편리해서, 함께 표현하려고...
// 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
// 문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.
// main에서 특정한 카드 객체 인스턴스를 만들어서 출력한다.

import Foundation

//struct 구조체 타입과 출력할 때 사용할 데이터를 extension으로 구분(중첩 타입의 구성)
struct Card {
    private let suit: Suit
    private let rank: Rank
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    var descrption: String {
        return "\(suit.rawValue)\(rank.rawValue)"
    }
}

extension Card {
    //nested enum에 대해 학습한 후, 이를 활용하여 구현하고자 시도
    //열거형의 경우 예상 입력값이 한정되어 있으므로 경우의 수가 정해져 있는 카드게임에 적합
    
    //suit, nested enumeration
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
        var description: String {
            switch self {
            case .spades: return "♠️"
            case .hearts: return "♥️"
            case .clubs: return "♣️"
            case .diamonds: return "♦️"
            }
        }
    }
    
    //rank, nested enumeration
    enum Rank: Int {
        case One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen
        var description: String {
            switch self {
            case .One:
                return "A"
            case .Three:
                return "J"
            case .Twelve:
                return "Q"
            case .Thirteen:
                return "K"
            default:
                return String(rawValue)
            }
        }
    }
}

func main(){
    let heartthree = Card(suit: .hearts, rank: .Three)
    let clubtwelve = Card(suit: .clubs, rank: .Twelve)
    
    print(heartking)
    print(clubace)
}

main()
