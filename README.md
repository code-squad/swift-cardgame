> `CardDeck` 구조체의 내용, 변수 및 메소드 명에 대한 설명을 기술하였습니다. 



## CardDeck

모든 종류의 `Card` 객체 인스턴스를 포함하는 카드팩 역할의 구조체입니다. 내부 변수 및 메소드로는 아래와 같은 내용을 담고 있습니다.

### 변수

- `private var cards: [Card]` : 모든 종류의  `Suit`와 `Rank`  조합의 `Card`를 배열로 담고 있습니다.
- `var isEmpty: Bool` : `cards` 변수가 비어있는지의 여부를 나타냅니다.

### 메소드

##### 따로 정의한 `Playable` 프로토콜을 채택하여 구현한 메소드입니다.

- ` count() -> Int`

- ` shuffle()`
- `removeOne() -> Card?`
- `reset()`
  - `fill()` :  `Suit`와 `Rank` 케이스를 탐색하면서 `cards` 변수에 모든 조합의 카드객체를 **채워**줍니다.

##### 추가로 생성한  `CardStack` 을 만들어주는 메소드입니다. 

- `removeMultiple( : ) -> CardStack?` : 기존의 `removeOne()` 메소드와 비슷한 역할을 하기 때문에 메소드 이름에 리턴되는 카드객체의 **단복수** 의미만 더해질 수 있도록 하였습니다. 

##### 선택한 메뉴항목에 따라 해당하는 메소드를 실행시킨 후, 출력할 결과 문자열을 만들어주는 메소드입니다.

- `makeResult( : ) -> String` : 단순히 결과값만 보여주는 것이 아니라, 파라미터로 받은 `MenuItem` 에 따라 해당하는 메소드를 **수행**한 후에 **결과**값을 **만들어**주는 역할을 하기 때문에 *make* 동사를 사용했습니다. 



아래는 `CardDeck` 구조체의 `removeMultiple()` 메소드를 활용해 `CardStack` 을 출력해본 결과입니다.

```swift
var cardDeck = CardDeck.init()
var cardStacks: [CardStack] = []
for number in 1...7 {
    guard let cardStack = cardDeck.removeMultiple(by: number) else { break }
    cardStacks.append(cardStack)
}
let result = cardStacks
	.map { "\($0)" }
	.joined(separator: "\n")
```

```swift
print(result)
// Prints below
[♦️5]
[♦️A, ♦️J]
[♦️7, ♦️8, ♣️3]
[♠️9, ♣️8, ♣️2, ♦️3]
[♣️Q, ♠️8, ♣️A, ♥️8, ♦️6]
[♠️10, ♠️Q, ♥️A, ♣️J, ♦️4, ♣️5]
[♠️2, ♥️9, ♠️7, ♠️3, ♦️K, ♦️Q, ♥️3]
```
