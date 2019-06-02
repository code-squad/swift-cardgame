import Foundation

struct InputView {
    
    static func ask(_ something: String) -> String {
        print("\(something): ", terminator: "")
        return readLine() ?? ""
    }
}
