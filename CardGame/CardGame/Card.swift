import Foundation

class Card: CustomStringConvertible {
    /* 카드 숫자는 종류가 13가지로 제한되어 있기 때문에 열거형을 선택함. 또한 Card 유형과 연관된 유형이기에 내포되도록 함.
     RawValue를 통한 인스턴스 생성도 가능하도록 카드 실제 숫자를 나타내는 Int를 RawValue로 가지도록 함.
     카드 덱을 만들기 용이하게 하기 위하여 CaseIterable을 Rank와 Suit에 채택함.
     */
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return String(self.rawValue)
            }
        }
    }
    
    // 무늬의 종류가 4가지로 제한되어 있기 때문에 열거형을 선택함.
    enum Suit: CaseIterable, CustomStringConvertible {
        case spades, hearts, diamonds, clubs
        
        var description: String {
            switch self {
            case .spades: return "♠"
            case .hearts: return "♥"
            case .diamonds: return "♦"
            case .clubs: return "♣"
            }
        }
    }
    
    private var rank: Rank
    private var suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
