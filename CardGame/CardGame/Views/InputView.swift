import Foundation

struct InputView {
    
    static func ask(_ something: String) -> String {
        print("\(something): ", terminator: "")
        return readLine() ?? ""
    }
    
    private static func show(options: [String]) {
        for index in options.indices {
            print("\(index + 1). \(options[index])")
        }
    }
    
    static func askForChoice(options: [String]) -> Int {
        show(options: options)
        while true {
            guard let choice = Int(ask("숫자 선택")),
                (1...options.count).contains(choice) else {
                    print("유효하지 않은 선택입니다. 다시 입력하세요.")
                    continue
            }
            return choice
        }
    }
}
