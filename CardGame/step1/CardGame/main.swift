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
