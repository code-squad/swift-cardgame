## 코딩 컨벤션


#### **Naming**

- 클래스와 구조체 이름은 대문자로 시작, 메소드 이름과 변수 이름은 소문자로 시작한다.
- 메소드명을 정할 때 시작은 동사형태로 시작하도록 한다.
- 클래스에 구조체에 대해서는 Upper Camel Case를 적용, 메스드와 변수명에 대해서는 Lower Camel Case를 적용한다.
```
class Person {
  let name: String = "dong min"
  let age: Int = 24
  let livingAdderss = "111/100"
}
```
- 열거형에 대해서는 선언에는 Upper Camel Case를 활용, case에 대해서는 Lower Camel Case를 활용한다.
```
Enum Shape {
  case triangle
  case rectangle
}
```


#### **Spacing**

- if/else/switch/while 의 중괄호는 항상 같은 라인에 사용한다.
```
if isArray {
} else {
}
```


#### **Comment**

- 코드와 같은 줄에는 주석을 사용하지 않는다.


#### **Use of Self**

- init()함수에서 초기화할 때, 이름과 속성 이름을 구분하는 데 필요할 때 self를 사용한다.
- 그 외에는 사용하지 않는다.


#### **Function Declarations**

- 짧은 함수를 선언할 시에는 한줄에 중괄호를 포함한다.
- 함수가 길어져서 줄바꿈이 생길 경우, 적절한 길이에서 줄바꿈을 하고 다음줄에는 들여쓰기를 포함한다.
```
func relateWithFriends(firstFriend: String, secondFriend: String, 
  thirdFriend: String) -> [String] {
  // Code
}
```

참조 링크 https://github.com/raywenderlich/swift-style-guide/
