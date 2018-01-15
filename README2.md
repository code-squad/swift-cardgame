### 코딩 스타일 가이드라인 참고문서
[swift.org_API_Guidelines ](https://swift.org/documentation/api-design-guidelines/#general-conventions) <br/>
[스타일쉐어 코딩가이드 참고](https://github.com/StyleShare/swift-style-guide)
<br/>

### 코딩 스타일
위에 기재한 코딩스타일 가이드라인을 참고하여, 추가적으로 아래와 같은 개인적인 규칙을 세워보았습니다.

- equals(`=`)기호를 사용할 때는 기호의 양 쪽에 공백을 씁니다.
  `private var cards = [Card]()`

- colon(`:`)기호를 사용할 때는 기호의 오른쪽에만 공백을 씁니다.  
  `var twoCards: [Card]`

- 함수의 return(`->`)기호를 사용할 때는 기호의 양 쪽에 공백을 씁니다.
  ```swift
  func removeOne() -> Card {
  //doSomething()
  }
  ```
- 공통적인 코드를 구분할 때는 `// MARK:`(주석예약어)를 사용합니다.
  ```swift
  func runProgram() {
  // doSomething()
  }

  // MARK: runStack only

  func runStack() {
    // doSomething()
  }
  ```
