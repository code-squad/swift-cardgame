# Card Game

## :round_pushpin: Step 9-1 카드 클래스

- Card class 설계
  - suits 4개 : ♠︎spade ♣︎club ♥︎heart ♦︎diamond
    - ♠︎spade `\u{2660}`
    - ♣︎club `\u{2663}`
    - ♥︎heart `\u{2665}`
    - ♦︎diamond `\u{2666}`
  - rank 1~13 : 1A, 11J, 12Q, 13K
    - J : Jack
    - Q: Queen
    - K : King
    - A: Ace
- `Card` class 내부에 각각 정의
  - enum `Suits` : 4가지 기호 케이스별로 나누기에 적절
  - enum `Rank` : 유한집합. 케이스별 처리 위해 enum로 구현
- `CustomStringConvertible` protocol 채택하기
  - `Card` class, enum `Suits`, `Rank`
  - 직관적인 인스턴스 출력을 위해 채택.



## :round_pushpin: Step 9-2 카드 덱

### suffle() 구현 - 무작위 순열 만드는 알고리즘

- 무작위로 선택할 때, 고려할 점

  - 이미 뽑혔던 element 가 안 뽑혀야 됨 -> 기존에 있는 요소인지 체크하는 과정 필요 -> 복잡도 ▲ 성능 ▼
  - 기존에 뽑았던 요소를 배제하고 이 과정을 반복하는 알고리즘이 필요

- Fisher-Yates shuffle algorithm ([wikipedia 참조]([https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#Fisher_and_Yates'_original_method](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle#Fisher_and_Yates'_original_method)))

  > **Fisher–Yates shuffle** is an [algorithm](https://en.wikipedia.org/wiki/Algorithm) for generating a [random permutation](https://en.wikipedia.org/wiki/Random_permutation) of a finite [sequence](https://en.wikipedia.org/wiki/Sequence)—in plain terms, the algorithm [shuffles](https://en.wikipedia.org/wiki/Shuffling) the sequence.

  - 방법
  1. 1~n 까지의 숫자를 쓴다
    2. 지워지지 않은 숫자 중 random number k를 고른다
    3. 남은 숫자의 개수를 세고, 지워지지 않은 숫자 k를 지우고, 그 숫자를 별도의 list에 쓴다.
    4. 모든 숫자가 지워질 때까지 2번을 반복
    5. 3번에서 쓴 별도의 list가 최종 random permutation 결과이다.
- 섞은 결과가 한쪽으로 편향되지 않고, 골고루? 잘 섞이는 방법이라고 한다.
  
  - 시간 복잡도 : O(n^2)
- 매 반복마다 남은 (지워지지 않은, 선택 안된) 숫자를 세는 과정이 필요 - O(n)
  
  - 랜덤 숫자 선택을 리스트 요소 개수에 비례해서 해야 함 - O(n)
  
- Knuth Shuffle

  - Fisher-Yates shuffle 의 현대 버전
  - 각 반복마다 남은 element 개수를 셀 필요가 없음 -> O(n)
  - 별도의 list 가 필요 없음. swap 할거니까

  - 핵심 개념

    - 한쪽 끝(앞 혹은 뒤)부터 한자리씩 이동하면서 각 자리에 들어갈 요소를 랜덤하게 뽑음
    - 랜덤 숫자 대상: 그 자리를 포함해서 아직 정하지 않은 자리에 있는 요소들
    - 랜덤하게 뽑힐 대상 리스트를 줄여가면서, 기존에 뽑힌 요소를 배제함
    - 랜덤 함수가 O(1) 의 시간복잡도를 가지면, 전체 알고리즘은 O(n)

  - pseudo code -- To shuffle an array a of n elements (indices 0..n-1):

    ```
    // list 뒷자리부터 한자리씩 섞기
    for i from n−1 downto 1 do
         j ← random integer such that 0 ≤ j ≤ i
         exchange a[j] and a[i]
         
    // list 앞에서부터 한자리씩 고를 경우
    for i from 0 to n−2 do
         j ← random integer such that i ≤ j < n
         exchange a[i] and a[j]
    ```

  - 뽑는 대상 list는 그 자리도 포함(inclusive) 해야한다. - 그래야 원래자리에 그대로 있는 경우도 포함해서 랜덤하게 섞을 수 있음

  - 대상 list가 하나 남은 경우는 어차피 뽑아도 그 요소이므로 배제

  - for 문 도는 대상 Index 는 **0 ~ n-2** / **1 ~ n-1** 이어야 함

  - *Example* : 앞 자리부터 한자리씩 골라 섞는 경우 

    ![](https://github.com/daheenallwhite/daheenallwhite.github.io/blob/master/assets/post-image/shuffle-algorithm.png)

  - *Example* : in Swift

    ```swift
    var array = [ 1,2,3,4,5 ]
    
    for i in 0..<array.count - 1 { // 0 ~ n-2
        let randomIndex = Int.random(in: i..<array.count)
        
        let temp = array[i]
        array[i] = array[randomIndex]
        array[randomIndex] = temp
    }
    
    print(array)
    //[2, 5, 1, 4, 3]
    ```

  - Reference

    - http://www.programming-algorithms.net/article/43676/Fisher-Yates-shuffle
    - https://www.geeksforgeeks.org/shuffle-a-given-array-using-fisher-yates-shuffle-algorithm/

### Struct  vs.  Class

- Struct : value type
  - 함수에 인자로 넘겨질 때, 변수에 할당될 때, value 가 **복사**된다
  - stack memory에 생성됨 (heap memory를 사용하는 경우도 있음. cow 전략을 채택하는 타입도 있음)
  - compile time 크기 예측 가능 -> 효율적 메모리 관리에 도움
- Class : reference type
  - value type 과 달리 복사되지 않고, reference 를 가진다.
  - 새로운 value 가 생성되지 않고, 메모리에 있는 동일한 인스턴스를 공유하게 된다.
  - heap memory에 생성됨
  - runtime 에 동적으로 할당 -> 예측 불가
- Struct containing many reference
  - 구조체 인스턴스가 많은 인스턴스를 참조하고 있다면, 해당 구조체를 인자로 넘기거나 다른 변수에 할당시 복사를 하면서 복사 + reference 도 추가 되어야 함 ->  많은 작업이 필요
  - 해당 구조체 인스턴스를 감싸는 wrapper class를 생성해서 사용하면, 여러 변수에서 해당 wrapper class를 참조해도 복사와 참조개수를 늘릴 필요없이 하나의 참조만 추가하면 됨
- step 에 적용 
  - card game 에서는 전체 게임에 하나의 card deck 만 사용함
  - Card는 list 내에서 순서가 바뀌는 작업을 많이 하게됨 -> struct 보단 class 로 구현해서 참조만 바뀌게 하는게 메모리 관리에적절하다고 판단
  - `CardDeck` 을 class 로 구현한다면? card 에 접근시 이중 reference 가 필요

### Xcode 메모리 관리 도구 

- [iOS — Identifying Memory Leaks using the Xcode Memory Graph Debugger](https://medium.com/zendesk-engineering/ios-identifying-memory-leaks-using-the-xcode-memory-graph-debugger-e84f097b9d15)



### ARC (Automatic Reference Counting)

- reference type 메모리 관리 방법으로 더이상 사용하지 않는 인스턴스를 메모리에서 release 하는 방법
- 필요한 동안만 메모리에 살아있게 하는 개념
- 각 인스턴스의 참조 개수를 카운트 하고, reference count == 0 이면 메모리 공간 회수
- compile time 에 결정됨 - compiler 가 참조 앞,뒤에 retain, release 처리를 넣어줌
- card game - CardDeck 안의  Card 인스턴스
  - reset() 으로 기존의 Card 인스턴스의 참조를 거두면 reference count ==0 이 됨 -> 메모리 공간 회수



### CardDeck & Card

`CardDeck` 에는 전체 card list 를 담는 `cards` property 가 있음

이를 생성하려면 `CardDeck`에서 `Card` 의 `Rank`, `Suit` 같은 상세 정보를 알아야 함 -> OOP 캡슐화 실패

Factory pattern 사용 - `CardFactory` 구조체 : 생성 과정의 구체적인 정보를 알지 않아도 되도록 처리



## :round_pushpin: Step 9-3 포커 딜러 출력

### GameInputView

- 메뉴, 참가자 명수 입력 받음

### Menu

- case: sevenCardStud, FiveCardStud
- 각 메뉴에 맞는 카드 개수를 반환할 `numberOfCards` property 

### Player <s>class</s> Protocol

- <s>플레이어 공통 함수, 속성 정의</s>

- <s>protocol 로 구현하지 않은 이유 : 공통 구현사항이 많아 protocol default implementation에는 한계가 있었음</s>

- 명시한 자격요건

  ```swift
  protocol Player {
      static var typeDescription: String { get }
      var cards: [Card] { get set }
      mutating func take(newCards: [Card])
  }
  ```

  

### Player <s>상속받은</s> 채택한 클래스 - Participant, Dealer

- class 로 구현한 이유 : reference 사용의 이점 때문에
  - struct 로 구현할 경우, 출력이나 for 문을 돌면서 임시변수에 들어갈 때, 값이 복사된다. 값이 복사되면서 각 struct instance 가 가진 card list 인스턴스에 대한 reference 도 일일히 복사되어야 한다. 반면에 class 의 경우, 각 플레이어의 레퍼런스만 넘기면 된다. 
- `typeDescription` 속성에 각각 "참가자", "딜러" 설정

### 게임을 지속할 수 있는지 확인 - hasEnoughCards()

게임 종료되어야 할 경우 : 남은 카드가 부족한 경우

```
card deck 에 남은 카드 < 필요한 카드 (카드 개수 * 전체 플레이어수)
```

`CardDeck` 에 `hasEnoughCards()` 가 체크하도록 함



### PlayerFactory

`makeAllPlayers()` : 입력받은 참가자수 + 딜러 생성



### 참가자 수 추상화 - NumberOfParticipants

1~4 이내 참가자 수 받을 수 있음 -> case 로 나타내어 범위 내로 처리할 수 있게끔 함



### OutputView - 타입별 출력 문자열 만들기

- `Participant` 이면 count 세서 숫자 넣기

### uml

![](https://github.com/daheenallwhite/daheenallwhite.github.io/blob/master/assets/post-image/swift-cardgame-diagram.png)

&nbsp;

## :round_pushpin: Step 9-4 승자 확인하기

### Hands 우선순위

*([우선순위참조](https://www.cardplayer.com/rules-of-poker/hand-rankings))*

| Hand                              |               | 우선순위 |
| --------------------------------- | ------------- | -------- |
| high card                         | 아무것도 없음 | 낮음     |
| *one pair*                        | pair 1개      |          |
| *two pair*                        | Pair 2개 이상 |          |
| *triple (three of kind)*          | 3개 숫자 같음 |          |
| *straight*                        | 5개 숫자 연속 |          |
| *four card (four of kind, quads)* | 4개 숫자 같음 | 높음     |

- Straight : `A, K, Q, J, 10` ~~ `A, 2, 3, 4, 5`
  - `10, J, Q, K, A` 도 연속임 
  - `A, 2, 3, 4, 5` 도 연속
  - 카드 순위 : `A, K, Q, J, 10, 9, … , 2`
- High hands or 같은 Hands 인 경우 : 숫자(rank)가 높은 사람이 승리

### 판단할 것들

1. hands 
2. High hands, 같은 hands 인 경우 rank가 높은 사람 확인하기

### 구현 방법

- `HandsDeterminator` : card list 받아서 hand와 highest rank (`Decision`) 만들기
  - 내부에서 Dictionary 구조에 [Card.Rank: Int] 로 rank 개수 셈
  - straight 인지 판단 : 연속해서 5개의 숫자가 나오는지
  - 그 외 hand 판단 : rank 개수에 따라 
    - 개수가 높은 순으로, 개수 같으면 rank 가 큰 순서대로 정렬해서
    - 맨 앞의 element가 제일 개수 높은 rank 임
- `Hands` enum : hands 우선순위 추상화
- `WinningDeterminator` : players 중에 winner 결정
  - hand 우선순위가 큰 플레이어가 이김
  - hand가 같으면 rank 가 더 높은 플레이어가 이김
- `Comparable` protocol : 순서 비교하기 위한 프로토콜
  - `Hands`, `Card.Rank` 가 채택해서 비교 기호로 우선순위 비교 가능하도록 구현

### UML

![](https://github.com/daheenallwhite/daheenallwhite.github.io/blob/master/assets/post-image/swift-cardgame-diagram-step4.png)

### Test

- `HandsDeterminator`
  - 주어진 카드에서 가장 높은 우선순위의 hand 와 rank를 선별할 수 있는가?
  - Hand 각 케이스를 잘 선별할 수 있는가?
  - 가장 높은 rank 를 가져올 수 있는가?
- `WinnerDeterminator`
  - hand 가 더 높은 플레이어 선택하는지
  - hand 가 같을 때, rank 가 더 높은 플레이어 선택하는지

