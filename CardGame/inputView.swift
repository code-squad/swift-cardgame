import Foundation

struct inputView {
    static func input(message: String) -> String {
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        print(">", terminator:"")
        
        let input = readLine()
        print(input)
        return input
    }
}
//end of code
