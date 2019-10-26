import Foundation

struct outputView {
    static func ResetAlert(in count: Int) {
        print("카드 전체를 초기화 하였습니다")
        print("총 (\count)장의 카드가 존재합니다."\n)
    }
    
    static func ShuffleAlert(in count: Int) {
        print("전체 (\count)장의 카드를 섞었습니다."\n)
    }
    
    static func PickAlert(in count: Int, with card: Card){
        print("\(card)")
        print("총 \(count)의 카드가 남아 있습니다."\n)
    }
}
