import Foundation

class InputView: TextView {
    
    func showInputDescription(_ description: String) {
        show("\(description): ", terminator: "")
    }
    
    func ask(_ something: String) -> String {
        showInputDescription(something)
        return readLine() ?? ""
    }
    
    /// 선택지에 번호를 붙여 텍스트로 나타냅니다.
    func showOptions<Option>(_ options: [Option]) {
        for index in options.indices {
            show("\(index + 1). \(options[index])")
        }
    }
}
