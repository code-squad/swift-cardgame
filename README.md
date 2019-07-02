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

<br>

## STEP 9-3. 포커 딜러 출력

<br>

### 📝 요구사항

- 포커 딜러 출력을 위한 새로운 입력 메뉴를 만든다. 
  - 7카드 스터드, 5카드 스터드 방식을 입력받는다
  - 참여자 수를 입력받는다.
- 참여자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다.
- 카드가 남으면 게임을 계속 진행하고,  부족하면 게임을 종료한다.

<br/>

### 🏗 전체 구조

-  `InputView`: 메뉴 출력 및 입력
- `GameInputView`: 게임 메뉴 출력 및 카드게임 종류와 참여자 수를 입력받는다.

<br>

- `Player`: `Playerable` 프로토콜을 채택, 자신의 순서와 카드들을 갖고 있다.
  - `Playerable` 프로토콜
  - 딜러가 나눠주는 카드를 `take()` 한다.
  - `PlayerPrintable` 프로토콜을 채택: 자신의 이름과 카드들을 프린트한다.
- `Dealer`: `Playerable` 프로토콜을 채택, 카드덱을 갖고 있음
  - `Dealerable` 프로토콜
  -  플레이어에게 카드를 `deal()` 나눠준다.
  - 필요한 카드 수에 대해 덱에 카드가 충분한지 확인한다.
  - 덱을 관리한다.
- `GameInfo`: `GameInfoable` 프로토콜을 채택, 게임모드와 참여자 수를 갖고 있다.
- `CardGame`: `GameInfo`, `Dealer`, `Player` 를 이용해 게임을 세팅하고 진행한다.
  - 딜러에게 카드의 개수가 충분한지 물어보고 충분하면 게임을 진행하고 충분하지 않으면 게임을 종료한다.
  - 참여자의 수만큼 Player 인스턴스를 생성한다. Dealer 인스턴스 또한 생성한다.
  - Player들에게 카드를 나눠준다. 
  - 게임을 run한다.

<br>

- `OutputView`: play 결과에 따라 출력