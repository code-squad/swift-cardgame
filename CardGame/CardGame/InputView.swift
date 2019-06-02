import Foundation

struct InputView {
    
    static func ask(_ something: String) -> String {
        print("\(something): ", terminator: "")
        return readLine() ?? ""
    }
    
    static func show(options: [String]) {
        for index in options.indices {
            print("\(index + 1). \(options[index])")
        }
    }
}
