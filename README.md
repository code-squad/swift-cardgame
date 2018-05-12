# CardGame의 객체들

#### class Card : 카드 1장을 표현하는 객체
* 프로퍼티
	- `suit` : 카드의 모양.
	- `number` : 카드의 숫자.
	- `description` : 카드 객체의 문자열 표현.(CustomStringConvertible)
	
#### struct Deck : 카드덱에서 사용하는 카드의 배열을 표현
* 프로퍼티
	- `cards` : 카드의 배열.
	
#### struct CardDeck : 카드의 덱을 표현하는 객체
* 프로퍼티
	- `deck` : 카드덱이 가지고 있는 카드들. (Deck객체로 표현)
* 메서드
	- `resetCard()` : 카드덱을 다시 초기화함.
	- `shuffleCard` : 카드덱을 섞음.
	- `remove(numberofCards:)` : 입력된 카드의 갯수만큼 카드덱에서 제거하고 제거된 카드의 배열을 반환.
	
#### struct CardStack : 카드게임에서 카드덱으로부터 제거된 카드를 할당받은 카드들을 표현하는 객체
* 프로퍼티
	- `cards` : 카드 스택이 가지고 카드들. 카드의 배열.
	- `description` : 카드스택의 문자열 표현.
* 메서드
	- `add(cards:)` : 입력된 카드만큼 `cards`에 카드추가.

#### struct AllCardStack : 카드게임에서 카드스택들을(카드스택의 배열) 표현하는 객체
* 프로퍼티
	- `cardStacks` : 카드스택의 배열을 표현.
* 메서드
	- `add(cards:at:)` : 입력된 카드를 입력된 카드스택의 인덱스에 추가한다.
	- `descriptionOfCardStack(at:)` : 입력받은 인덱스의 카드스택의 문자열 표현을 반환.

#### class CardGame : main함수에서 실제 카드게임의 기능과 역할을 해내는 객체
* 프로퍼티
	- `numberOfCardStacks` : 카드게임의 카드스택 갯수.
	- `cardDeck` : 카드게임의 카드덱.
	- `allCardStack` : 카드게임의 모든 카드스택을 표현.
* 메서드
	- `resetGame()` : 카드덱과 모든 카드스택을 초기화.
	- `shuffleCard()` : 카드덱을 섞음.
	- `drawCard()` : 카드덱에서 카드를 뽑고 뽑은 카드를 카드스택에 할당한다.
	- `descriptionOfCardStack(at:)` : OutputView에서 카드스택을 출력하기 위한 메서드(CardStackPrintable 프로토콜의 메서드)
	
#### struct OutputView
* `printCardStack(_:numberOfCardStack:)` : 입력된 카드게임의 입력된 카드스택의 갯수만큼 카드스택을 출력한다.