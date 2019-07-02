# Card Game

<br/>

## STEP 9-1. 카드 클래스

<br/>

### 📝 요구사항

- 카드 객체 인스턴스를 만들어서 출력한다.

<br/>

### 🏗 전체 구조

- class `Card`
  - enum `Suit`, enum `Rank` 를 갖고 있다.
- enum `Suit`
  - 카드 모양: ❤️, ♦️, ♠️, ♣️
- enum `Rank`
  - 카드 숫자: 1 ~ 13, ace(1), jack(11), queen(12), king(13)

<br/>

## STEP 9-2. 카드덱 구현

<br>

### 📝 요구사항

- 카드 객체 인스턴스를 갖고 있는 카드덱을 만든다.
- 카드덱에는 count, shuffle, removeOne, reset 기능이 있다.

<br/>

### 🏗 전체 구조

-  `InputView`: 메뉴 출력 및 입력

<br>

- `CardGame`: 전달받은 메뉴로 `CardDeck` 을 이용한 game play
  - CardDeck에서 reset()을 할 때 Card 인스턴스를 이용해서 생성을 하게 된다.
  - `CardMaker` 를 이용해서 CardDeck에서는 Card를 알지 않고 CardMaker가 생성해주는 카드들을 받는다.
- `CardGameResult`: 게임 play 결과

<br>

- `OutputView`: play 결과에 따라 출력

<br/>



### Protocol에 Generic 사용 - associatedtype

```swift
protocol Deck {
    associatedtype Element
    var count: Int { get }
    func reset()
    func shuffle()
    func removeOne() -> Element?
}

class CardDeck: Deck {
    typealias Element = Card
    
```

